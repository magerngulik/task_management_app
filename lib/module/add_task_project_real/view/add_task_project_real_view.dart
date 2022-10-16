import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/textfield_project_task_real.dart';

class AddTaskProjectRealView extends ConsumerWidget {
  const AddTaskProjectRealView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    AddTaskProjectRealController controller =
        ref.watch(addTaskProjectRealController);
    controller.view = this;

    const list = [
      'Computer',
      'Mobile',
      'Chat',
    ];
    String dropdownValue = list.first;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Task Project Real'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextfieldProject(
                  value: "",
                  hinttext: "Title Project",
                  label: "Title",
                  maxlines: 1,
                  onChanged: ((value) {})),
              const SizedBox(
                height: 10.0,
              ),
              TextfieldProject(
                  value: "",
                  hinttext: "This project for ...",
                  label: "Description",
                  maxlines: 4,
                  onChanged: ((value) {})),
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: TextStyle(color: CpWarna.Color3),
                onChanged: (String? value) {
                  dropdownValue = value!;
                  controller.notifyListeners();
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
