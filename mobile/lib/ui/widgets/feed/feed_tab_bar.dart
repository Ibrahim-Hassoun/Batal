import 'package:flutter/material.dart';
import 'package:mobile/main.dart';

class FeedTabBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          GestureDetector(
            onTap: () {
              print('Text clicked');
            },
            child: Text(
              'Following',
              style: TextStyle(
                color: text_gray,
                fontSize: 16,
                
              ),
            ),
          ),
          SizedBox(width: 16,),
          GestureDetector(
            onTap: () {
              print('Text clicked');
            },
            child: Text(
              'Trending',
              style: TextStyle(
                color: text_gray,
                fontSize: 16,
                
              ),
            ),
          ),
          SizedBox(width: 16,),
          GestureDetector(
            onTap: () {
              print('Text clicked');
            },
            child: Text(
              'Tournaments',
              style: TextStyle(
                color: text_gray,
                fontSize: 16,
                
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}