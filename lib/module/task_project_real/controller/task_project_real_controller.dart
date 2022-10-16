import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/task_project_real_view.dart';

class TaskProjectRealController extends ChangeNotifier implements HyperController {
  TaskProjectRealView? view;
}

final taskProjectRealController =
    ChangeNotifierProvider<TaskProjectRealController>((ref) {
  return TaskProjectRealController();
});