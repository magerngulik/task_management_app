import 'package:flutter/material.dart';

import '../../../shared/collor_pallets.dart';

class CardPersonalTask extends StatefulWidget {
  final String? title;
  final String? description;
  final String? dateline;
  Function? deleteData;
  final IconData? iconDefault;
  final bool? statusDateline;

  CardPersonalTask(
      {Key? key,
      required this.title,
      required this.description,
      required this.deleteData,
      required this.dateline,
      this.statusDateline,
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
                  style: TextStyle(
                      fontSize: 25.0,
                      color: CpWarna.Color6,
                      fontWeight: FontWeight.bold,
                      decoration: (widget.statusDateline == true)
                          ? TextDecoration.none
                          : TextDecoration.lineThrough),
                ),
                Text(
                  "${widget.description}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: CpWarna.Color2,
                      decoration: (widget.statusDateline == true)
                          ? TextDecoration.none
                          : TextDecoration.lineThrough),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  "${widget.dateline}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 15.0,
                      color: CpWarna.Color5,
                      fontWeight: FontWeight.bold,
                      decoration: (widget.statusDateline == true)
                          ? TextDecoration.none
                          : TextDecoration.lineThrough),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => widget.deleteData,
            icon: Icon(
              (widget.statusDateline == true)
                  ? widget.iconDefault ?? Icons.menu
                  : Icons.disabled_by_default,
              size: 24.0,
              color:
                  (widget.statusDateline == true) ? Colors.black : Colors.red,
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
