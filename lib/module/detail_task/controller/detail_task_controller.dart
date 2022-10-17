import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/detail_task_view.dart';

class DetailTaskController extends ChangeNotifier implements HyperController {
  DetailTaskView? view;
}

final detailTaskController =
    ChangeNotifierProvider<DetailTaskController>((ref) {
  return DetailTaskController();
});