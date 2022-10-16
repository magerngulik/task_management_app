import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/add_task_project_view.dart';

class AddTaskProjectController extends ChangeNotifier
    implements HyperController {
  AddTaskProjectView? view;
  var taskProject = [];
  String tasklisttitle = "";

  refresh() {
    notifyListeners();
  }

  var title;
  var description;
  var selectedDate;

  addData() async {
    debugPrint("title: $title");
    debugPrint("description: $description");
    debugPrint("selectedDate: $selectedDate");
    debugPrint("taskProject: ${taskProject.toString()}");

    try {
      await FirebaseFirestore.instance.collection("personal_task").add({
        "title": title,
        "description": description,
        "selected_date": selectedDate,
        "task_project": taskProject,
      });

      taskProject.clear();
      notifyListeners();
      Get.back();
    } catch (e) {}
  }
}

final addTaskProjectController =
    ChangeNotifierProvider<AddTaskProjectController>((ref) {
  return AddTaskProjectController();
});
