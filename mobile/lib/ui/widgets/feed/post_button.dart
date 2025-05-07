import 'package:flutter/material.dart';

class PostButton extends StatefulWidget {
  final VoidCallback onClicked;
  final String label;
  final IconData? icon;

  const PostButton({
    Key? key,
    required this.onClicked,
    required this.label,
    this.icon,
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.blue[700] : Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon != null) ...[
              Icon(
                widget.icon,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              widget.label,
              style: const TextStyle(
                color: Colors.white,
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