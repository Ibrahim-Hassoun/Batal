import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        // ... your post header code remains unchanged ...

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
      ],
    );
  }
}
