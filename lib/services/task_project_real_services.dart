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

  static addProjectTask({
    required String id,
    required String title,
  }) async {
    await FirebaseFirestore.instance.collection("todo_list_project").add({
      "uid_task": id,
      "title": title,
      "status": false,
      "created_at": DateTime.now(),
    });
  }

  static updateStatusTask(String id, bool status) async {
    await FirebaseFirestore.instance
        .collection("todo_list_project")
        .doc(id)
        .update({
      "status": status,
    });
  }
}
