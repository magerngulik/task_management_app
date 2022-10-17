import 'package:fhe_template/module/login/widget/textfieldLogin.dart';
import 'package:fhe_template/shared/collor_pallets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controller/login_controller.dart';

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    LoginController controller = ref.watch(loginController);
    controller.view = this;

    var loginWidget = Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: CpWarna.Color1,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Manage Task",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextfieldLogin(onChanged: ((value) {}), label: "Email"),
              const SizedBox(
                height: 10.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextfieldLogin(onChanged: ((value) {}), label: "Password"),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 40,
                width: 200,
                child: ElevatedButton.icon(
                  icon: const FaIcon(FontAwesomeIcons.google, size: 15),
                  label: const Text("Login with google"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  onPressed: () {
                    controller.doLogin();
                  },
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                "Belum memiliki akun?",
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () {
                  controller.isLogin = false;
                  controller.refresh();
                },
                child: const Text(
                  "Create an account",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    var isRegister = Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: CpWarna.Color1,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Register",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextfieldLogin(
                  onChanged: ((value) {
                    controller.username = value;
                  }),
                  label: "Username"),
              const SizedBox(
                height: 10.0,
              ),
              TextfieldLogin(
                  onChanged: ((value) {
                    controller.email = value;
                  }),
                  label: "Email"),
              const SizedBox(
                height: 10.0,
              ),
              TextfieldLogin(
                  onChanged: ((value) {
                    controller.password = value;
                  }),
                  label: "Password"),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  onPressed: () {
                    controller.doTryAddData();
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              InkWell(
                onTap: () {
                  controller.isLogin = true;
                  controller.refresh();
                },
                child: const Text(
                  "Sudah punya akun?",
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: CpWarna.Color2,
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://i.ibb.co/19t3Fcp/icon-karakter-login.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              (controller.isLogin == true) ? loginWidget : isRegister,
            ],
          ),
        ),
      ),
    );
  }
}
