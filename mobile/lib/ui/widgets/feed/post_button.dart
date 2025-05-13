import 'package:flutter/material.dart';
import 'package:mobile/main.dart';

class PostButton extends StatefulWidget {
  final VoidCallback onClicked;
  final String label;
  final IconData icon;
  final bool? isLiked;
  final int PostId;

  const PostButton({
    super.key,
    required this.onClicked,
    required this.label,
    required this.icon,
    required this.PostId,
    this.isLiked
  });

  @override
  PostButtonState createState() => PostButtonState();
}

class PostButtonState extends State<PostButton> {
  bool _isHovered = false;
  late bool _isLiked;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked ?? false;
    print('initial value of isLiked in button is: ${_isLiked}');
  }

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
          color:_isLiked? const Color.fromARGB(255, 14, 120, 207):text_gray,
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(
          widget.label,
          style: TextStyle(
          color: _isLiked ? const Color.fromARGB(255, 14, 120, 207) : text_gray,
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