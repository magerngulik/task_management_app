import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/task_project_real_controller.dart';

class TaskProjectRealView extends ConsumerWidget {
  const TaskProjectRealView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    TaskProjectRealController controller = ref.watch(taskProjectRealController);
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Project'),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text("Tambah Task"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24), // <-- Radius
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddTaskProjectRealView()),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [
              //body
            ],
          ),
        ),
      ),
    );
  }
}
