import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier implements HyperController {
  LoginView? view;
  bool isLogin = true;
  String? username;
  String? email;
  String? password;

  doLogin() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    showDialog(
        context: Get.currentContext,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    try {
      await googleSignIn.disconnect();
    } catch (_) {}

    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      var userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      debugPrint("userCredential: $userCredential");
      Navigator.of(Get.currentContext).pop();
      Get.offAll(const NavigatorView());
    } catch (_) {
      debugPrint("variableName: Gagal Login");
    }
  }

  doRegister() async {
    debugPrint("username: $username");
    debugPrint("email: $email");
    debugPrint("password: $password");

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      await FirebaseFirestore.instance.collection("user").add({
        "username": username,
        "email": email,
        "password": password,
      });
      Get.to(const NavigatorView());
      debugPrint("Status Login: Berhasil Register");
    } catch (e) {
      debugPrint("Status Login: Gagal Register");
    }
  }

  doTryAddData() async {
    await FirebaseFirestore.instance.collection("user").add({
      "username": "user1",
      "email": "User1@gmail.com",
      "password": "User123456",
    });
  }

  refresh() {
    notifyListeners();
  }
}

final loginController = ChangeNotifierProvider<LoginController>((ref) {
  return LoginController();
});
