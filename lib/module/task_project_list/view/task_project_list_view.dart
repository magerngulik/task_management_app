import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/taskproject_services.dart';

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
                height: 600.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: CpWarna.Color2,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      16.0,
                    ),
                  ),
                ),
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("personal_task")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) return const Text("Error");
                    if (snapshot.data == null) return Container();
                    if (snapshot.data!.docs.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 300.0,
                            width: 300.0,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://i.ibb.co/gPQJ2mb/no-data.png",
                                ),
                                fit: BoxFit.fitWidth,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  16.0,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            "Belum ada data",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      );
                    }
                    final data = snapshot.data!;
                    return ListView.builder(
                      itemCount: data.docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> item =
                            (data.docs[index].data() as Map<String, dynamic>);
                        item["id"] = data.docs[index].id;
                        var id = data.docs[index].id;

                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (detail) {},
                          confirmDismiss: (direction) async {
                            bool confirm = false;
                            await showDialog<void>(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Confirm'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: const <Widget>[
                                        Text(
                                            'Are you sure you want to delete this item?'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey[600],
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("No"),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blueGrey,
                                      ),
                                      onPressed: () {
                                        confirm = true;
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Yes"),
                                    ),
                                  ],
                                );
                              },
                            );
                            if (confirm) {
                              TaskProjectService.deleteData(id);
                              controller.notifyListeners();
                              return Future.value(true);
                            }
                            return Future.value(false);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: CardPersonalTask(
                              title: "${item['title']}",
                              description: " ${item['description']}",
                              iconDefault: Icons.edit,
                              deleteData: () {},
                            ),
                          ),
                        );
                      },
                    );
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
