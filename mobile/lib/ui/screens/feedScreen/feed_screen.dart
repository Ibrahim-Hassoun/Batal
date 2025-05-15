import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:mobile/main.dart';
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
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: SizedBox(height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('What\'s on your mind?',style: TextStyle(color: text_gray),),
                  SvgPicture.asset('assets/image-plus.svg',color: text_gray,)
                ],
              ),
              ),
            ),
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
                          Story(userName: 'Your Story',storyImageUrl: 'https://media.boohoo.com/i/boohoo/amm07233_black_xl/male-black-man-active-performance-muscle-fit-raglan-tee?w=700&qlt=default&fmt.jp2.qlt=70&fmt=auto&sm=fit',isViewed: true,),
                          Story(userName: 'Moe Jawhar',storyImageUrl: 'https://img.freepik.com/free-photo/front-view-fit-man-holding-dumbbells_23-2149517267.jpg?ga=GA1.1.624058667.1747277893&semt=ais_hybrid&w=740',profileImageUrl: 'https://img.freepik.com/premium-photo/image-very-muscular-man-posing-with-naked-torso-studio-looking-black-background_157927-19852.jpg',isViewed: true,),
                          Story(userName: 'Toni Khabbaz',storyImageUrl: 'https://img.freepik.com/free-photo/portrait-muscular-handsome-bodybuilder-sportswear-standing-with-crossed-arms-studio-isolated-gray-background_613910-19683.jpg?semt=ais_hybrid&w=740',profileImageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',isViewed: true,),
                          Story(userName: 'Ahmad Rashwani',storyImageUrl: 'https://img.freepik.com/free-photo/sporty-positive-guy-holds-pair-dumbbells-isolated-grey-background_613910-603.jpg?semt=ais_hybrid&w=740',profileImageUrl: 'https://images.pexels.com/photos/2294361/pexels-photo-2294361.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',isViewed: true,),
                         
                         
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
                 return  Post(id: postData['id'],Name: postData['user']['first_name']+' '+ postData['user']['last_name'],profileImageUrl: postData['user']['profile_photo_path'],PostImageUrl:postData['image_path'],description: postData['description'],comments:postData['comments'],time: DateTime.parse(postData['created_at']) ,isLiked: postData['my_reaction']==null?false:true,);
              },
            ),
             
          
        
          ],
        ),
      ),
     
    );
  }
}