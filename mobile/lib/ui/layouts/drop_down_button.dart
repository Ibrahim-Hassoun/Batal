import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  @override
  _DropdownButtonExampleState createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String selectedValue = 'Option 1';
  List<String> items = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      icon: Icon(Icons.arrow_drop_down), // arrow icon
      elevation: 16,
      style: TextStyle(color: Colors.black, fontSize: 16),
      underline: Container(height: 2, color: Colors.blue),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}