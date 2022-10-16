import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/add_task_project_real_view.dart';

class AddTaskProjectRealController extends ChangeNotifier implements HyperController {
  AddTaskProjectRealView? view;
}

final addTaskProjectRealController =
    ChangeNotifierProvider<AddTaskProjectRealController>((ref) {
  return AddTaskProjectRealController();
});