import 'package:flutter/material.dart';
import 'package:mobile/main.dart';

class CustomDropdownButton extends StatefulWidget {
  final String label;
  final String selectedValue;
  final Function() onChanged;
  final List<String> items;

  
  const CustomDropdownButton({
    Key? key,
    required this.label,
    required this.onChanged,
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
    selectedValue = '';

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
      
     
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: bg_gray, 
          borderRadius: BorderRadius.circular(80),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                selectedValue.isNotEmpty ? selectedValue : widget.label,
              style: TextStyle(color: secondaryColor),
            ),
            Icon(Icons.arrow_drop_down, color: secondaryColor),
          ],
        ),
      ),
    );

  }
}