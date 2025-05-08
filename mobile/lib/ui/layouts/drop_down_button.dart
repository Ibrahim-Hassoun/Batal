import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final String selectedValue;
  final List<String> items;

  
  const CustomDropdownButton({
    Key? key,
     
    required this.items,
    this.selectedValue = '',
  }) : super(key: key);

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  late String selectedValue;
  late List<String> items;

  @override
  void initState() {
    super.initState();
    items = widget.items;
    selectedValue = widget.selectedValue.isNotEmpty ? widget.selectedValue : (items.isNotEmpty ? items[0] : '');
  }

  @override
  Widget build(BuildContext context) {

    return PopupMenuButton<String>(
      onSelected: (value) {
        print('Selected: $value');
        setState(() {
          selectedValue = value;
        });
        
      },
      itemBuilder: (BuildContext context) => items
          .map((item) => PopupMenuItem<String>(
            value: item,
            child: Text(item),
          ))
          .toList(),
      
      // 🎯 Custom button appearance
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.blue, 
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              selectedValue,
              style: TextStyle(color: Colors.white), // Text color
            ),
            Icon(Icons.arrow_drop_down, color: Colors.white),
          ],
        ),
      ),
    );

  }
}