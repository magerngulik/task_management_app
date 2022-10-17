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
    var jumlah = item!['todo_list_project'].length;
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
                        label: "$jumlah",
                        sublabel: "Task",
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      CardTask(
                        onChanged: (value) {},
                        label: "50%",
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
                  // Container(
                  //   height: 460.0,
                  //   decoration: const BoxDecoration(
                  //     borderRadius: BorderRadius.all(
                  //       Radius.circular(
                  //         16.0,
                  //       ),
                  //     ),
                  //   ),
                  //   child: ListView.builder(
                  //     itemCount: todo.length,
                  //     shrinkWrap: true,
                  //     itemBuilder: (context, index) {
                  //       var itemTodo = todo[index] as Map;
                  //       return InkWell(
                  //         onTap: () {},
                  //         child: Padding(
                  //           padding: const EdgeInsets.only(left: 30.0),
                  //           child: Row(
                  //             children: [
                  //               Container(
                  //                 height: 40.0,
                  //                 width: 300,
                  //                 padding: const EdgeInsets.symmetric(
                  //                     horizontal: 10.0),
                  //                 decoration: BoxDecoration(
                  //                   color: CpWarna.Color4,
                  //                   borderRadius: const BorderRadius.all(
                  //                     Radius.circular(
                  //                       24.0,
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 child: Center(
                  //                   child: Text(
                  //                     "${itemTodo['title']}",
                  //                     style: const TextStyle(
                  //                       fontSize: 18.0,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //               Checkbox(
                  //                   value: itemTodo['status'],
                  //                   onChanged: (value) {
                  //                     TaskProjectRealServices.updateStatusTask(
                  //                         id: item!['id'],
                  //                         index: index,
                  //                         status: value!);
                  //                   })
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
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
