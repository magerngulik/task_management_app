import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/welcome_view.dart';

class WelcomeController extends ChangeNotifier implements HyperController {
  WelcomeView? view;
}

final welcomeController =
    ChangeNotifierProvider<WelcomeController>((ref) {
  return WelcomeController();
});