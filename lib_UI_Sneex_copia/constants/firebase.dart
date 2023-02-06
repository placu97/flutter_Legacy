import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final Future<FirebaseApp> fireInit = Firebase.initializeApp();
FirebaseFirestore fireStore  =FirebaseFirestore.instance;
FirebaseAuth fireAuth = FirebaseAuth.instance;
FirebaseFunctions fireFuncs = FirebaseFunctions.instance;