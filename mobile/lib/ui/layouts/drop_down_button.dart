import 'package:flutter/material.dart';
import 'package:mobile/main.dart';

class CustomDropdownButton extends StatefulWidget {
  final String label;
  final String? selectedValue;
  final Function(String) onChanged;
  final List<String> items;

  const CustomDropdownButton({
    super.key,
    required this.label,
    required this.onChanged,
    required this.items,
    this.selectedValue,
  });

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? _internalValue;
  String capitalize(String input) {
  if (input.isEmpty) return input;
  return input[0].toUpperCase() + input.substring(1);
}
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
            child: SizedBox(
              width: 100, // 👈 Dropdown item width
              child: Text(item),
            ),
          ))
      .toList(),
  child: SizedBox(
    width: 100, // 👈 Set width for the button itself
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bg_gray,
        borderRadius: BorderRadius.circular(80),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 👈 Optional: space between text & icon
        children: [
          Expanded(
            child: Text(
              _internalValue?.isNotEmpty == true
                  ? capitalize(_internalValue!)
                  : widget.label,
              style: TextStyle(color: secondaryColor),
              overflow: TextOverflow.ellipsis, // 👈 Prevents overflow
            ),
          ),
          Icon(Icons.arrow_drop_down, color: secondaryColor),
        ],
      ),
    ),
  ),
);

  }
}