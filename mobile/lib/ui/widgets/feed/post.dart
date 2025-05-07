import 'package:flutter/material.dart';
import 'package:mobile/main.dart';


class Post extends StatefulWidget {
  final String Name;
  final String? PostImageUrl;
  final String? profileImageUrl;
  final String? description;
  final bool isViewed;
  final bool hasStory;
  final bool? storyIsSeen;


  const Post({
    super.key,
    required this.Name,
    required this.PostImageUrl,
    this.profileImageUrl,
    this.description,
    this.isViewed = false,
    this.hasStory = false,
    this.storyIsSeen
  });

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 16),
      Row(//whole row on top before description
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(//left part of the post header
                  children: [
                    Container(//pp
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.orange, width: 2),
                        image: widget.profileImageUrl != null
                          ? DecorationImage(
                            image: NetworkImage(widget.profileImageUrl!),
                            fit: BoxFit.cover,
                          )
                          : null,
                      ),
                      child: widget.profileImageUrl == null
                        ? Icon(Icons.person, size: 30, color: Colors.grey)
                        : null,
                      ),
                    SizedBox(width: 8,),
                    Column(//name and time
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('John Doe',style: TextStyle(color: secondaryColor,fontSize: 16,fontWeight:FontWeight.w500),),
                        Text('Just now',style: TextStyle(color: text_gray,fontSize: 16,fontWeight:FontWeight.w400,),)
                      ],
                    ),
                  ],
                ),
                Row(//right part of the post header

                )
              ],
            ),
          ),
        ],
        
        
      )
    ],);
  }}