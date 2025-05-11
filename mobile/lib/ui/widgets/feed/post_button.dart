import 'package:flutter/material.dart';
import 'package:mobile/main.dart';

class PostButton extends StatefulWidget {
  final VoidCallback onClicked;
  final String label;
  final IconData icon;

  const PostButton({
    Key? key,
    required this.onClicked,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  _PostButtonState createState() => _PostButtonState();
}

class _PostButtonState extends State<PostButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClicked,
      onTapDown: (_) => setState(() => _isHovered = true),
      onTapUp: (_) => setState(() => _isHovered = false),
      onTapCancel: () => setState(() => _isHovered = false),
      child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: MediaQuery.of(context).size.width / 3,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
        Icon(
          widget.icon,
          color: text_gray,
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(
          widget.label,
          style: const TextStyle(
          color: text_gray,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          ),
        ),
        ],
      ),
      ),
    );
  }
}