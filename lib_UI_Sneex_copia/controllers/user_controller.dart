import 'package:firebase_auth/firebase_auth.dart';
import 'package:firetest/constants/show_loading.dart';
import 'package:firetest/models/user_model.dart';
import 'package:firetest/screens/auth/auth_screen.dart';
import 'package:firetest/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:firetest/constants/firebase.dart';

// *** AUTH & USER ACCORPATI ***
class UserController extends GetxController {
  static UserController userController = Get.find();

  Rx<User> firebaseUser;

  // Auth
  RxBool isLoginWidgetDisplayed = true.obs ;
  // ***Auth introduce User
  // i dati di autenticazioni formano lo user
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController passwd = TextEditingController();
  
  // User (IDENTITY, es userModel.value.id
  // Later _clearControllers()
  Rx<UserModel> userModel = UserModel().obs;

  // Admin
  Rx<bool> isAdmin = false.obs;


  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User>(fireAuth.currentUser);
    // ADMIN
    if (fireAuth.currentUser.uid.compareTo("7w430J7KBtMjrii9waM1v01iPpe2").isEqual(0)){
      isAdmin.value = true;
      //print(isAdmin);
    };
    //print(fireAuth.currentUser.uid.compareTo("7w430J7KBtMjrii9waM1v01iPpe2").isEqual(0));
    firebaseUser.bindStream(fireAuth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    //Get.offAll( () => AuthenticationScreen());
  }
  // Property of *onReady*
  _setInitialScreen(User user) {
    if (user == null) {
      Get.offAll(() => AuthenticationScreen());
    } else {
      userModel.bindStream(listenToUser());//Keeps it update with : (Stream<UserModel>)
      Get.offAll(() => HomeScreen());
    }
  }
  

  // +*+*+* Public Methods *+*+*+
  changeLoginWidgetDisplayed() {
    isLoginWidgetDisplayed.value = ! isLoginWidgetDisplayed.value ;
  }

  void signIn() async {
    try {
      await fireAuth.signInWithEmailAndPassword(
        email: email.text.trim(), password: passwd.text.trim())
      .then((result) {
        _clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try Again");
    }
  }

  void signUp() async {
    showLoading();
    try {
      await fireAuth.createUserWithEmailAndPassword(
        email: email.text.trim(), password: passwd.text.trim())
      .then((result) {
        String _userId = result.user.uid;
        _addUserToFirestore(_userId);
        _clearControllers();
      });
    } catch(e) {
      debugPrint(e.toString());
      Get.snackbar("Sign Up Failed", "Try again");
    }
  }

  void signOut() async {
    fireAuth.signOut();
  }

  updateUserData( Map<String, dynamic> data) {
    fireStore.collection("users")
      .doc(firebaseUser.value.uid)
      .update(data);
  }
  //  *+*+*+*

  // -*-*-* Private Methods *-*-*-
  _addUserToFirestore(String _userId) {
    fireStore.collection("users").doc(_userId).set({
      "name" : name.text.trim(),
      "id" : _userId,
      "email" : email.text.trim(),
      "cart" : []
    });
  }
  _clearControllers() {
    email.clear();
    name.clear();
    passwd.clear();
  }
  //  *-*-*-*
  

  // Continuamente controlla e aggiorna lo status di UserModel
  // Status Polling UserModel
  Stream<UserModel> listenToUser() => fireStore
  .collection("users")
  .doc(firebaseUser.value.uid)
  .snapshots()
  .map((snapshot) => UserModel.fromSnapshot(snapshot));

}