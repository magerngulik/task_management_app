import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/navigator_view.dart';

class NavigatorController extends ChangeNotifier implements HyperController {
  NavigatorView? view;
}

final navigatorController =
    ChangeNotifierProvider<NavigatorController>((ref) {
  return NavigatorController();
});