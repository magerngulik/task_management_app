import 'package:flutter/material.dart';

import '../../../shared/collor_pallets.dart';

class CardPersonalTask extends StatefulWidget {
  final String? title;
  final String? description;
  Function? deleteData;
  final IconData? iconDefault;

  CardPersonalTask(
      {Key? key,
      required this.title,
      required this.description,
      required this.deleteData,
      this.iconDefault})
      : super(key: key);

  @override
  State<CardPersonalTask> createState() => _CardPersonalTaskState();
}

class _CardPersonalTaskState extends State<CardPersonalTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: CpWarna.Color1,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            24.0,
          ),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.title}",
                  style: TextStyle(fontSize: 25.0, color: CpWarna.Color6),
                ),
                Text(
                  "${widget.description}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20.0, color: CpWarna.Color2),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => widget.deleteData,
            icon: Icon(
              widget.iconDefault ?? Icons.menu,
              size: 24.0,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }
}
