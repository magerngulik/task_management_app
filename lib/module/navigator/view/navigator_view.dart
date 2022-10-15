import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/navigator_controller.dart';

class NavigatorView extends ConsumerWidget {
  const NavigatorView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    NavigatorController controller = ref.watch(navigatorController);
    controller.view = this;
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Navigator'),
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