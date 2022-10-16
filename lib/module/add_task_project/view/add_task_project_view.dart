import 'package:fhe_template/core.dart';
import 'package:fhe_template/shared/widget/datepicker/datepicker.dart';
import 'package:fhe_template/shared/widget/textfield/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTaskProjectView extends ConsumerWidget {
  const AddTaskProjectView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    AddTaskProjectController controller = ref.watch(addTaskProjectController);
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tambah Task Project'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExTextField(
                id: "title",
                hintText: "-",
                label: "Title",
                textFieldType: TextFieldType.normal,
                size: 50,
                onChanged: (text) {
                  controller.title = text;
                },
              ),
              ExTextField(
                  id: "description",
                  hintText: "-",
                  label: "Deskripsi",
                  textFieldType: TextFieldType.normal,
                  onChanged: (text) {
                    controller.description = text;
                  },
                  size: 100),
              ExDatePicker(
                  id: "date_line",
                  label: "Time Piker",
                  onChanged: ((value) {
                    controller.selectedDate = value;
                  })),
              const SizedBox(
                height: 10.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "List Task",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              Container(
                height: 300.0,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: CpWarna.Color2,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      12.0,
                    ),
                  ),
                ),
                child: ListView.builder(
                  itemCount: controller.taskProject.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = controller.taskProject[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          "$item",
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            controller.taskProject.removeAt(index);
                            controller.notifyListeners();
                          },
                          icon: const Icon(
                            Icons.delete,
                            size: 24.0,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                      ],
                    );
                  },
                ),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24), // <-- Radius
                  ),
                ),
                onPressed: () {
                  // controller.taskProject.add("Number 5");
                  // controller.notifyListeners();
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Title',
                                    labelStyle: TextStyle(
                                      color: Colors.blueGrey,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    controller.tasklisttitle = value;
                                  },
                                  onSaved: (value) {
                                    controller.tasklisttitle = value!;
                                  }),
                            ),
                            ElevatedButton.icon(
                              icon: const Icon(Icons.add),
                              label: const Text("Tambah"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(12), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                controller.taskProject
                                    .add(controller.tasklisttitle);

                                controller.notifyListeners();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text("Simpan"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  onPressed: () {
                    controller.addData();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
