import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './core.dart';

void main() async {
  await initialize();

  Widget mainView = const LoginView();
  if (FirebaseAuth.instance.currentUser != null) {
    mainView = const NavigatorView();
  }

  runApp(
    ProviderScope(
      child: MaterialApp(
        navigatorKey: Get.navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: mainView,
      ),
    ),
  );
}
