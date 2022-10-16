import 'package:flutter/material.dart';
import '../../../shared/collor_pallets.dart';

class TextfieldLogin extends StatefulWidget {
  final String? value;
  final Function(String value) onChanged;
  final String? label;

  const TextfieldLogin({
    Key? key,
    this.value,
    required this.onChanged,
    required this.label,
  }) : super(key: key);

  @override
  State<TextfieldLogin> createState() => _TextfieldLoginState();
}

class _TextfieldLoginState extends State<TextfieldLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        margin: const EdgeInsets.only(),
        child: TextFormField(
          initialValue: null,
          decoration: InputDecoration(
              hintText: widget.label,
              hintStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
              fillColor: CpWarna.Color1,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ))),
          onChanged: (value) {
            widget.onChanged(value);
          },
        ),
      ),
    );
  }
}
