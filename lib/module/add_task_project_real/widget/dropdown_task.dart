import 'package:flutter/material.dart';

import '../../../shared/collor_pallets.dart';

class DropdownTask extends StatefulWidget {
  final String value;
  final Function(String value) onChanged;
  final String? label;
  final List? listitem;

  const DropdownTask({
    Key? key,
    required this.value,
    required this.onChanged,
    this.label,
    this.listitem,
  }) : super(key: key);

  @override
  State<DropdownTask> createState() => _DropdownTaskState();
}

class _DropdownTaskState extends State<DropdownTask> {
  @override
  Widget build(BuildContext context) {
    const list = [
      'Computer',
      'Mobile',
      'Chat',
    ];
    String dropdownValue = widget.listitem!.first;

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Padding(
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
          ),
          DropdownButton<String>(
            value: dropdownValue,
            dropdownColor: Colors.white,
            icon: const Icon(Icons.select_all),
            elevation: 16,
            style: TextStyle(color: CpWarna.Color3),
            onChanged: (String? value) {
              dropdownValue = value!;
              widget.onChanged(dropdownValue);
              setState(() {});
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

//  DropdownButton<String>(
//           value: dropdownValue,
//           icon: const Icon(Icons.select_all),
//           elevation: 16,
//           style: TextStyle(color: CpWarna.Color3),
//           onChanged: (String? value) {
//             dropdownValue = value!;
//             setState(() {});
//           },
//           items: list.map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//         ),