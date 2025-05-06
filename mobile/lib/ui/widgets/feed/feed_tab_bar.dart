import 'package:flutter/material.dart';
import 'package:mobile/main.dart';

class FeedTabBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: secondaryColor, width: 2),
            ),
            child: Icon(Icons.add, color: secondaryColor, size:24),
            ),
            SizedBox(width: 16),
          Icon(Icons.search, color: secondaryColor, size:32),
          SizedBox(width: 16),
          Icon(Icons.chat, color: secondaryColor, size: 32),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}