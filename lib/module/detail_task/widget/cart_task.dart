import 'package:flutter/material.dart';

import '../../../shared/collor_pallets.dart';

class CardTask extends StatefulWidget {
  final String? value;
  final Function(String value) onChanged;
  final String? label;
  final String? sublabel;
  final double? fsLabel;
  final double? fsSubLabel;

  const CardTask({
    Key? key,
    this.value,
    required this.onChanged,
    this.label,
    this.sublabel,
    this.fsLabel,
    this.fsSubLabel,
  }) : super(key: key);

  @override
  State<CardTask> createState() => _CardTaskState();
}

class _CardTaskState extends State<CardTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        color: CpWarna.Color3,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            16.0,
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${widget.label}",
              style: TextStyle(
                fontSize: widget.fsLabel ?? 35.0,
                color: Colors.white,
              ),
            ),
            Text(
              "${widget.sublabel}",
              style: TextStyle(
                fontSize: widget.fsSubLabel ?? 35.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
