import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskProjectListView extends ConsumerWidget {
  const TaskProjectListView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    TaskProjectListController controller = ref.watch(taskProjectListController);
    controller.view = this;

    return Scaffold(
      backgroundColor: CpWarna.Color2,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Task Project List'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Tambah Task"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24), // <-- Radius
                  ),
                ),
                onPressed: () {
                  Get.to(const AddTaskProjectView());
                },
              ),
              Container(
                height: 700.0,
                decoration: BoxDecoration(
                  color: Colors.red[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
