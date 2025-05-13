import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/main.dart';
import './post_button.dart';
import '../../../lib/time_formatter/time_formatter.dart';


class Post extends StatefulWidget {
  final String id;
  final String Name;
  final String? PostImageUrl;
  final String? profileImageUrl;
  final String? description;
  final bool isViewed;
  final bool hasStory;
  final bool? storyIsSeen;
  final int comments;
  final DateTime time;
  bool isLiked;

  Post({
    super.key,
    required this.id,
    required this.Name,
    this.PostImageUrl,
    this.profileImageUrl,
    this.description,
    this.isViewed = false,
    this.hasStory = false,
    this.storyIsSeen,
    required this.comments,
    required this.time,
    required this.isLiked
  });

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
       Row(//whole row on top before description
        mainAxisSize: MainAxisSize.max,
        children: [
          
          Expanded(
            child: Padding(
            
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
                          image:  DecorationImage(
                                image: NetworkImage(
                                widget.profileImageUrl ??
                                  'https://ui-avatars.com/api/?name=&background=eeeeee&color=ffffff'
                                ),
                              fit: BoxFit.cover,
                            )
                            ,
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
                          Text(widget.Name,style: TextStyle(color: secondaryColor,fontSize: 16,fontWeight:FontWeight.w500),),
                          Text(formatTimeAgo(widget.time),style: TextStyle(color: text_gray,fontSize: 16,fontWeight:FontWeight.w400,),)
                        ],
                      ),
                    ],
                  ),
                  Row(//right part of the post header
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      SvgPicture.asset(
                      'assets/ellipsis.svg',
                      width: 24,
                      height: 24,
                      color: text_gray,
                    ),
                    SizedBox(width: 12,),
                      SvgPicture.asset(
                      'assets/x.svg',
                      width: 24,
                      height: 24,
                      color: text_gray,
                    ),
                    ] 
                  )
                
                ],
              ),
            ),
          ),
        ],
        
        
      ),

        if (widget.description != null) SizedBox(height: 8),
        if (widget.description != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final maxLines = 2;
                final text = widget.description!;
                final textStyle = TextStyle(color: text_gray, fontSize: 14);
                final textSpan = TextSpan(text: text, style: textStyle);
                final textPainter = TextPainter(
                  text: textSpan,
                  maxLines: maxLines,
                  textDirection: TextDirection.ltr,
                )..layout(maxWidth: constraints.maxWidth);

                final isOverflowing = textPainter.didExceedMaxLines;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: textStyle,
                      maxLines: _isExpanded ? null : maxLines,
                      overflow:
                          _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                    ),
                    if (isOverflowing || _isExpanded)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        child: Text(
                          _isExpanded ? 'See less' : 'See more',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 130, 130, 130),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
      if (widget.PostImageUrl!=null)
      SizedBox(height: 8,),
      if (widget.PostImageUrl!=null)
      Image.network(
        widget.PostImageUrl!,
        height: 375,
        width: double.infinity,
        fit: BoxFit.cover,
      ),

      Padding(//reactions and shares
        padding: EdgeInsets.only(left: 16,right: 16,top: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
              Text("${widget.comments}", style: TextStyle(color: text_gray)),
              SizedBox(width: 4),
              Icon(Icons.favorite_border, color: text_gray, size: 20),
             
            ],
            ),
          Text("${widget.comments} comments",style: TextStyle(color: text_gray),)
        ]),
      ),

      Padding(//actions on the post
        padding: EdgeInsets.only(top: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          PostButton(onClicked: (){}, label: 'Like',icon: Icons.thumb_up,PostId: widget.id,isLiked: widget.isLiked,),
          PostButton(onClicked: (){}, label: 'Comment',icon: Icons.comment,PostId: widget.id),
          
          PostButton(onClicked: (){}, label: 'Share',icon: Icons.share,PostId: widget.id),
          
        ]),
      ),
      ],
    );
  }
}
