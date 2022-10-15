import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/profile_view.dart';

class ProfileController extends ChangeNotifier implements HyperController {
  ProfileView? view;
}

final profileController =
    ChangeNotifierProvider<ProfileController>((ref) {
  return ProfileController();
});