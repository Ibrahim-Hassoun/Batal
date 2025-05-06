import 'package:flutter/material.dart';

class FeedAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.add, color: Colors.black, size: 24),
          Icon(Icons.search, color: Colors.black, size: 24),
          Icon(Icons.chat, color: Colors.black, size: 24),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}