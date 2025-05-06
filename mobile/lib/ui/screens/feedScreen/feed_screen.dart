import 'package:flutter/material.dart';
import '../../widgets/feed/feed_app_bar.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FeedAppBar(),
      body: Center(
        child: Text('Hey, this is feed screen'),
      ),
    );
  }
}