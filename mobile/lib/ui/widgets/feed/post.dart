import 'package:flutter/material.dart';


class Post extends StatefulWidget {
  final String Name;
  final String PostImageUrl;
  final String? profileImageUrl;
  final bool isViewed;
  final bool hasStory;
  final bool? storyIsSeen;


  const Post({
    super.key,
    required this.Name,
    required this.PostImageUrl,
    this.profileImageUrl,
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
    return Scaffold();
  }}