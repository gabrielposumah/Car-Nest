import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:product_share_suzuki/app.dart';


Future<void> main() async {
  // Todo : Add widgets binding
  // Todo : Init local storage
  // Todo : Init payment methods
  // Todo : Await native splash
  // Todo : Initialize Firebase

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(FirebaseApp value) => get.put(AuthenticationRepository());
  // Todo : Initialize Authentications

  runApp(const App());
}
