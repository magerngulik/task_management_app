import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTaskProjectRealView extends ConsumerWidget {
  const AddTaskProjectRealView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    AddTaskProjectRealController controller =
        ref.watch(addTaskProjectRealController);
    controller.view = this;

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextfieldProject(
                    value: "",
                    hinttext: "Title Project",
                    label: "Title",
                    maxlines: 1,
                    onChanged: ((value) {
                      controller.title = value;
                    })),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextfieldProject(
                    value: "",
                    hinttext: "This project for ...",
                    label: "Description",
                    maxlines: 4,
                    onChanged: ((value) {
                      controller.description = value;
                    })),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownTask(
                  value: '',
                  onChanged: (value) {
                    controller.project_category = value;
                    controller.notifyListeners();
                  },
                  label: "Project Category",
                  listitem: const [
                    'Computer',
                    'Mobile',
                    'Chat',
                  ],
                ),
              ),
              ExDatePicker(
                  id: "date_line",
                  label: "Date line",
                  onChanged: ((value) {
                    controller.selectedDate = value;
                  })),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //   child: Row(
              //     children: [
              //       const Text(
              //         "List Task",
              //         style: TextStyle(
              //           fontSize: 15.0,
              //         ),
              //       ),
              //       const Spacer(),
              //       ElevatedButton.icon(
              //         icon: const Icon(Icons.add),
              //         label: const Text("Tambah List"),
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: Colors.blueGrey,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(24), // <-- Radius
              //           ),
              //         ),
              //         onPressed: () {
              //           showModalBottomSheet(
              //               context: context,
              //               builder: (context) {
              //                 return Column(
              //                   children: [
              //                     Container(
              //                       padding: const EdgeInsets.all(12),
              //                       margin: const EdgeInsets.symmetric(
              //                           horizontal: 20),
              //                       child: TextFormField(
              //                           decoration: const InputDecoration(
              //                             hintText: 'Title',
              //                             labelStyle: TextStyle(
              //                               color: Colors.blueGrey,
              //                             ),
              //                             enabledBorder: UnderlineInputBorder(
              //                               borderSide: BorderSide(
              //                                 color: Colors.blueGrey,
              //                               ),
              //                             ),
              //                           ),
              //                           onChanged: (value) {
              //                             controller.tasklisttitle = value;
              //                           },
              //                           onSaved: (value) {
              //                             controller.tasklisttitle = value!;
              //                           }),
              //                     ),
              //                     ElevatedButton.icon(
              //                       icon: const Icon(Icons.add),
              //                       label: const Text("Tambah"),
              //                       style: ElevatedButton.styleFrom(
              //                         backgroundColor: Colors.blueGrey,
              //                         shape: RoundedRectangleBorder(
              //                           borderRadius: BorderRadius.circular(
              //                               12), // <-- Radius
              //                         ),
              //                       ),
              //                       onPressed: () {
              //                         controller.taskProject.add({
              //                           "title": controller.tasklisttitle,
              //                           "status": false
              //                         });

              //                         controller.notifyListeners();
              //                         Navigator.of(context).pop();
              //                       },
              //                     ),
              //                   ],
              //                 );
              //               });
              //         },
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   height: 300.0,
              //   margin: const EdgeInsets.symmetric(horizontal: 10.0),
              //   decoration: BoxDecoration(
              //     color: CpWarna.Color2,
              //     borderRadius: const BorderRadius.all(
              //       Radius.circular(
              //         12.0,
              //       ),
              //     ),
              //   ),
              //   child: ListView.builder(
              //     itemCount: controller.taskProject.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       var item = controller.taskProject[index];
              //       bool status = item['status'].toString() == 'true';
              //       // bool b = boolAsString == 'true';
              //       return Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           const SizedBox(
              //             width: 10.0,
              //           ),
              //           Checkbox(value: false, onChanged: (value) {}),
              //           Expanded(
              //             child: Text(
              //               "${item['title']}",
              //               maxLines: 1,
              //               overflow: TextOverflow.fade,
              //               style: const TextStyle(
              //                 fontSize: 18.0,
              //               ),
              //             ),
              //           ),
              //           const Spacer(),
              //           IconButton(
              //             onPressed: () {
              //               controller.taskProject.removeAt(index);
              //               controller.notifyListeners();
              //             },
              //             icon: const Icon(
              //               Icons.delete,
              //               size: 24.0,
              //               color: Colors.red,
              //             ),
              //           ),
              //           const SizedBox(
              //             width: 20.0,
              //           ),
              //         ],
              //       );
              //     },
              //   ),
              // ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24), // <-- Radius
                    ),
                  ),
                  onPressed: () {
                    controller.addData();
                  },
                  child: const Text("Simpan Data"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
