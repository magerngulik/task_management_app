import 'package:flutter/material.dart';

class TextfieldProject extends StatefulWidget {
  final String? value;
  final Function(String value) onChanged;
  final String? label;
  final String? hinttext;
  final int? maxlines;

  const TextfieldProject({
    Key? key,
    this.value,
    required this.onChanged,
    required this.label,
    required this.hinttext,
    this.maxlines,
  }) : super(key: key);

  @override
  State<TextfieldProject> createState() => _TextfieldProjectState();
}

class _TextfieldProjectState extends State<TextfieldProject> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 4.0,
            right: 4.0,
            top: 4.0,
            bottom: 4.0,
          ),
          child: Text(
            widget.label!,
          ),
        ),
        const SizedBox(
          height: 4.0,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(),
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: Colors.grey[900]!,
            ),
          ),
          child: TextField(
            maxLines: widget.maxlines ?? 1,
            decoration: InputDecoration.collapsed(
              hintText: widget.hinttext,
              hintStyle: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[400],
              ),
            ),
            onChanged: (value) {
              widget.onChanged(value);
            },
          ),
        ),
      ],
    );
  }
}
