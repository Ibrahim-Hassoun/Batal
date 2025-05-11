import 'package:flutter/material.dart';
import '../../widgets/feed/feed_app_bar.dart';
import '../../widgets/feed/feed_tab_bar.dart';
import '../../widgets/feed/story.dart';
import '../../widgets/feed/post.dart';

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero, 
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 4,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 244, 240, 240),
            ),
            FeedTabBar(),
            
            Container(
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
                    ),
                    SizedBox(height: 12),
                    
                  ],
                ),
              ),
            Container(
                      height: 4,
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromARGB(255, 244, 240, 240),
            ),
           
             
             
            Post(Name: 'John Doe',PostImageUrl:'https://randomuser.me/api/portraits/men/1.jpg',profileImageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',description: 'This is a post description for fffffffffffffffffffffffffffffffffffffffffffertgdfvljkhsdfgiophasdfoiuhweoufihwasdoiufhsdljkvnsdfoivjweiofgmy postt',)
        
          ],
        ),
      ),
     
    );
  }
}