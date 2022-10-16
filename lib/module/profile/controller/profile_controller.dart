import 'package:fhe_template/core.dart';
import 'package:fhe_template/services/user_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/profile_view.dart';

class ProfileController extends ChangeNotifier implements HyperController {
  ProfileView? view;
  doLogoutUser() async {
    UserService.doLogout();
    Get.offAll(const LoginView());
  }
}

final profileController = ChangeNotifierProvider<ProfileController>((ref) {
  return ProfileController();
});
