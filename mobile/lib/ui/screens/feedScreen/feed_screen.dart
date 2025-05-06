import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed Screen'),
      ),
      body: Center(
        child: Text('Hey, this is feed screen'),
      ),
    );
  }
}