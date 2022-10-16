import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/task_project_list_view.dart';

class TaskProjectListController extends ChangeNotifier implements HyperController {
  TaskProjectListView? view;
}

final taskProjectListController =
    ChangeNotifierProvider<TaskProjectListController>((ref) {
  return TaskProjectListController();
});