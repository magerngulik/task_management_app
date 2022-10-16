import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskProjectService {
  static deleteData(String id) async {
    try {
      await FirebaseFirestore.instance
          .collection("personal_task")
          .doc(id)
          .delete();
    } catch (e) {
      debugPrint("Status: Gagal Delete");
    }
  }
}
