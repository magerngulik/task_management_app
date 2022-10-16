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
}
