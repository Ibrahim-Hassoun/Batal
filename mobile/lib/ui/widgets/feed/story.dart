import 'package:flutter/material.dart';
import 'package:mobile/main.dart';

class Story extends StatefulWidget {
  final String userName;
  final String storyImageUrl;
  final String? profileImageUrl;
  final bool isViewed;

  const Story({
    super.key,
    required this.userName,
    required this.storyImageUrl,
     this.profileImageUrl,
    this.isViewed = false,
  });

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  bool _isViewed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isViewed = true;
        });
        
      },
      child: Container(
        width: 110,
        height: 180,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(widget.storyImageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 60,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            
          if (widget.profileImageUrl != null)
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: primaryColor,
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: Image.network(
                    widget.profileImageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  widget.userName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            
           
          
          ],
        ),
      ),
    );
  }
}