import 'package:flutter/material.dart';
import '../../widgets/feed/feed_app_bar.dart';
import '../../widgets/feed/feed_tab_bar.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FeedAppBar(),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            FeedTabBar(),
            Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16),
              
            ),
            ),
          
        ],
      )
    );
  }
}