import 'package:flutter/material.dart';
import 'package:mobile/core/provider/feed_provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/feed/feed_app_bar.dart';
import '../../widgets/feed/feed_tab_bar.dart';
import '../../widgets/bottom_navbar/bottom_navbar.dart';
import '../../../core/provider/bottom_navbar_provider.dart';
import '../../widgets/feed/story.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FeedAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 4,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 244, 240, 240),
          ),
          ChangeNotifierProvider(
            create: (_) => FeedProvider(),
            child: FeedTabBar(),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16),
              child: Column(
                children: [
                  SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero, 
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Story(userName: 'Your Story',storyImageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',isViewed: true,),
                        Story(userName: 'Your Story',storyImageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',profileImageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',isViewed: true,),
                        Story(userName: 'Your Story',storyImageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',profileImageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',isViewed: true,),
                        Story(userName: 'Your Story',storyImageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',profileImageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',isViewed: true,),
                       
                      ],
                    ),
                  )
                  
                ],
              ),
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