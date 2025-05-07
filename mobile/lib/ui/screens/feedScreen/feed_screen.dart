import 'package:flutter/material.dart';
import 'package:mobile/core/provider/feed_provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/feed/feed_app_bar.dart';
import '../../widgets/feed/feed_tab_bar.dart';
import '../../widgets/bottom_navbar/bottom_navbar.dart';
import '../../../core/provider/bottom_navbar_provider.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FeedAppBar(),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 4,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 244, 240, 240),
            ),
            ChangeNotifierProvider(
              create: (_)=>FeedProvider(),
              child: FeedTabBar(),
            ),
            Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16),
              
            ),
            ),
          
        ],
      ),
      bottomNavigationBar: ChangeNotifierProvider(
        create: (_) => BottomNavbarProvider(),
        child: BottomNavbar(),
      ),
    );
  }
}