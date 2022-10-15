import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/welcome_controller.dart';

class WelcomeView extends ConsumerWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    WelcomeController controller = ref.watch(welcomeController);
    controller.view = this;
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Welcome'),
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