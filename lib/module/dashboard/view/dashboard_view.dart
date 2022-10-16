import 'package:fhe_template/module/dashboard/widget/card_persona_task.dart';
import 'package:fhe_template/shared/collor_pallets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/dashboard_controller.dart';
import '../widget/card_project.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    DashboardController controller = ref.watch(dashboardController);
    controller.view = this;

    return SafeArea(
      child: Scaffold(
        backgroundColor: CpWarna.Color2,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                        "Hallo, ${FirebaseAuth.instance.currentUser!.displayName!}",
                        style: GoogleFonts.lato(
                          color: Colors.red,
                          fontSize: 25.0,
                        )),
                    const Spacer(),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                        FirebaseAuth.instance.currentUser!.photoURL!,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 25.0,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'You Have ',
                      style: TextStyle(fontSize: 20.0, color: CpWarna.Color3),
                      children: const <TextSpan>[
                        TextSpan(
                            text: '5',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            )),
                        TextSpan(text: ' Task Today!'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: CpWarna.Color7,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: null,
                          decoration: InputDecoration.collapsed(
                            filled: true,
                            fillColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            hintText: "Search Task",
                            hintStyle: TextStyle(
                              color: CpWarna.Color1,
                              fontSize: 20.0,
                            ),
                          ),
                          onFieldSubmitted: (value) {},
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                child: Text("Projects",
                    style: GoogleFonts.lato(
                      color: CpWarna.Color3,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 180.0,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: CardProject(
                        image: "https://i.ibb.co/bzZcPcP/icon-computer.png",
                        title: "Dashboard",
                        description:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                        jmlTask: "6",
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                child: Text("Personal Task",
                    style: GoogleFonts.lato(
                      color: CpWarna.Color3,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = {};
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: CardPersonalTask(
                      title: "Portofolio Overview",
                      description:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
