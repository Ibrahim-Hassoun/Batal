import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import 'package:provider/provider.dart';
import '../../../core/provider/feed_provider.dart';

class FeedTabBar extends StatefulWidget implements PreferredSizeWidget {
  const FeedTabBar({super.key});

  @override
  _FeedTabBarState createState() => _FeedTabBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _FeedTabBarState extends State<FeedTabBar> {
  @override
  Widget build(BuildContext context) {
    String active = Provider.of<FeedProvider>(context).active;
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Provider.of<FeedProvider>(context,listen: false).setActive("following");
            },
            child: Text(
              'Following',
              style: TextStyle(
                color: active == "following" ? primaryColor : text_gray,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              Provider.of<FeedProvider>(context,listen: false).setActive("trending");
            },
            child: Text(
              'Trending',
              style: TextStyle(
                color: active == "trending" ? primaryColor : text_gray,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              Provider.of<FeedProvider>(context,listen: false).setActive("tournaments");
            },
            child: Text(
              'Tournaments',
              style: TextStyle(
                color: active == "tournaments" ? primaryColor : text_gray,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}