import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class TaskProjectRealServices {
  deleteTask(String id) async {
    try {
      await FirebaseFirestore.instance
          .collection("project_task")
          .doc(id)
          .delete();
    } catch (e) {
      debugPrint("Status: Gagal Delete");
    }
  }

  static updateStatusTask(
      {required String id, required int index, required bool status}) async {
    try {
      await FirebaseFirestore.instance
          .collection("project_task")
          .doc(id)
          .update({
        "todo_list_project"[index]: {"status": status}
      });
    } catch (e) {
      debugPrint("Status: Gagal Update ");
    }
  }

  static addProjectTask() {}
}
