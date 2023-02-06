import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocityx/models/user.dart';
import 'package:velocityx/screens/home/home_get_final.dart';
import 'package:velocityx/screens/auth/login_get_final.dart';
import 'package:velocityx/constants/firebase.dart';
import 'package:velocityx/constants/show_loading.dart';

class AuthController extends GetxController {
  static AuthController authController = Get.find();
  RxBool isLoggedIn = false.obs;
  Rx<User> firebaseUser;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Rx<UserModel> userModel = UserModel().obs;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen( User user) {
    if ( user == null  ) {
      Get.offAll( () => LoginPage_GetFinal());
    } else {
      Get.offAll( () => HomePage_GetFinal());
    }
  }

  void signIn()async{
    try {
      showLoading();
      auth.signInWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signUp()async{
    try {
      showLoading();
      auth.createUserWithEmailAndPassword(email: email.text.trim(), password: password.text.trim())
      .then((result) {
        String _userId = result.user.uid;
        _addUserToFirestore(_userId);
        _initializeUserModel(_userId);
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signOut() {
    auth.signOut();
  }


  _addUserToFirestore(String _userId) {
    firebaseFirestore.collection("users").doc(_userId).set({
          "name": name.text.trim(),
          "id": _userId,
          "email": email.text.trim()
        });
  }

  _initializeUserModel(String _userId)async{
    userModel.value = await firebaseFirestore
    .collection("users")
    .doc(_userId)
    .get()
    .then((doc) => UserModel.fromSnapshot(doc));
  }
}