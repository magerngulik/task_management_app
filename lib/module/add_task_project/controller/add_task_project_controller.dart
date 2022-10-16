import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/add_task_project_view.dart';

class AddTaskProjectController extends ChangeNotifier implements HyperController {
  AddTaskProjectView? view;
}

final addTaskProjectController =
    ChangeNotifierProvider<AddTaskProjectController>((ref) {
  return AddTaskProjectController();
});