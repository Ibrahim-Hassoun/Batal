import 'package:flutter/material.dart';
import 'package:mobile/main.dart';

class CustomDropdownButton extends StatefulWidget {
  final String label;
  final String? selectedValue;
  final Function(String) onChanged;
  final List<String> items;

  const CustomDropdownButton({
    Key? key,
    required this.label,
    required this.onChanged,
    required this.items,
    this.selectedValue,
  }) : super(key: key);

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? _internalValue;

  @override
  void didUpdateWidget(covariant CustomDropdownButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedValue != oldWidget.selectedValue) {
      setState(() {
        _internalValue = widget.selectedValue;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _internalValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        setState(() {
          _internalValue = value;
        });
        widget.onChanged(value);
      },
      itemBuilder: (BuildContext context) => widget.items
          .map((item) => PopupMenuItem<String>(
                value: item,
                child: Text(item),
              ))
          .toList(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: bg_gray,
          borderRadius: BorderRadius.circular(80),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _internalValue?.isNotEmpty == true
                  ? _internalValue!
                  : widget.label,
              style: TextStyle(color: secondaryColor),
            ),
            Icon(Icons.arrow_drop_down, color: secondaryColor),
          ],
        ),
      ),
    );
  }
}