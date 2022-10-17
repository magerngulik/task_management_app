import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/core.dart';
import 'package:fhe_template/module/detail_task/widget/cart_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailTaskView extends ConsumerWidget {
  Map? item;
  DetailTaskView({this.item, Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    DetailTaskController controller = ref.watch(detailTaskController);
    controller.view = this;
    // var jumlah = item!['todo_list_project'].length;
    var time = item!['date_line'].toDate();
    var tmount =
        DateFormat.MMM().format((item!['date_line'] as Timestamp).toDate());

    var dateline = "${time.day} $tmount";
    var todo = item!['todo_list_project'];
    return Scaffold(
      backgroundColor: CpWarna.Color2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: double.infinity,
              decoration: BoxDecoration(
                color: CpWarna.Color1,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(
                    32.0,
                  ),
                  bottomRight: Radius.circular(
                    32.0,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text("Dashboard",
                        style: GoogleFonts.lato(fontSize: 30)),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardTask(
                        onChanged: (value) {},
                        label: "${controller.total}",
                        sublabel: "Task",
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      CardTask(
                        onChanged: (value) {},
                        label: "${controller.totalTaskComplete}",
                        sublabel: "Complete",
                        fsSubLabel: 20,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      CardTask(
                        onChanged: (value) {},
                        label: dateline,
                        fsLabel: 30,
                        sublabel: "Dateline",
                        fsSubLabel: 20,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 300,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("todo_list_project")
                          .where("uid_task", isEqualTo: item!['id'])
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) return const Text("Error");
                        if (snapshot.data == null) return Container();
                        if (snapshot.data!.docs.isEmpty) {
                          return const Center(
                            child: Text(
                              "Belum ada data yang di tambahkan",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }
                        final data = snapshot.data!;

                        return ListView.builder(
                          itemCount: data.docs.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> itemTask = (data.docs[index]
                                .data() as Map<String, dynamic>);
                            itemTask["id"] = data.docs[index].id;
                            controller.total = data.docs.length;
                            if (itemTask['status'].toString() == true) {
                              controller.totalTaskComplete + 1;
                            }

                            return InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40.0,
                                      width: 300,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      decoration: BoxDecoration(
                                        color: CpWarna.Color4,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                            24.0,
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${itemTask['title']}",
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                        value: itemTask['status'],
                                        onChanged: (value) {
                                          TaskProjectRealServices
                                              .updateStatusTask(
                                                  itemTask["id"], value!);
                                          controller.notifyListeners();
                                        })
                                  ],
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
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.symmetric(horizontal: 20),
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
                              TaskProjectRealServices.addProjectTask(
                                  id: item!['id'],
                                  title: controller.tasklisttitle);

                              controller.notifyListeners();
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Row(
                    children: [
                      Text("Create New Task",
                          style: GoogleFonts.lato(fontSize: 30)),
                      const Spacer(),
                      const CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        child: Icon(
                          Icons.add,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
