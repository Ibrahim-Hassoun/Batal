import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../widgets/feed/feed_app_bar.dart';
import '../../widgets/feed/feed_tab_bar.dart';
import '../../widgets/feed/story.dart';
import '../../widgets/feed/post.dart';
import './feed_logic.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  FeedScreenState createState() => FeedScreenState();
}

class FeedScreenState extends State<FeedScreen> {
List< dynamic> posts= [] ;
@override
void initState() {
  super.initState();
  _loadPostsAsync();
}

void _loadPostsAsync() async {
  final loadedPosts = await loadPosts();
  setState(() {
    posts = loadedPosts;
  });
}

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
           
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling
              shrinkWrap: true,
              itemCount: posts.length,
              itemBuilder: (context,index){
                 var postData = posts[index]; 
                 return  Post(Name: postData['user']['first_name']+' '+ postData['user']['last_name'],profileImageUrl: postData['user']['profile_photo_path'],PostImageUrl:postData['image_path'],description: postData['description'],comments:postData['comments'],time: DateTime.parse(postData['created_at']) ,);
              },
            ),
             
          
        
          ],
        ),
      ),
     
    );
  }
}