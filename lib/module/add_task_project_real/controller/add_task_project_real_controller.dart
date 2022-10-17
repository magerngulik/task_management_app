import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/add_task_project_real_view.dart';

class AddTaskProjectRealController extends ChangeNotifier
    implements HyperController {
  AddTaskProjectRealView? view;

  String? project_category;
  String? category = "";
  String? imgCategory = "";
  String tasklisttitle = "";
  var list = [
    'Computer',
    'Mobile',
    'Chat',
  ];
  var taskProject = [];
  DateTime? selectedDate;
  String title = "";
  String description = "";

  addData() async {
    if (project_category == null || project_category == "Computer") {
      category = "Computer";
      imgCategory = "https://i.ibb.co/bzZcPcP/icon-computer.png";
    } else if (project_category == "Mobile") {
      category = "Mobile";
      imgCategory = "https://i.ibb.co/d2phv0G/icon-smartphonepng.png";
    } else {
      category = "Chat";
      imgCategory = "https://i.ibb.co/5WQSMKM/icon-message.png";
    }

    debugPrint("title: $title");
    debugPrint("description: $description");
    debugPrint("category: $category");
    debugPrint("img_category: $imgCategory");
    debugPrint("date_line: $selectedDate");
    debugPrint("todo_list_project: $taskProject");
    try {
      await FirebaseFirestore.instance.collection("project_task").add({
        "title": title,
        "description": description,
        "category": category,
        "img_category": imgCategory,
        "date_line": selectedDate,
        "todo_list_project": taskProject,
      });
      Get.back();
    } catch (e) {
      debugPrint("Status Code: Data gagal di tambahkan");
    }
  }
}

final addTaskProjectRealController =
    ChangeNotifierProvider<AddTaskProjectRealController>((ref) {
  return AddTaskProjectRealController();
});
