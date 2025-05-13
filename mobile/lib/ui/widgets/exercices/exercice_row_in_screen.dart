import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExerciseRowInScreen extends StatefulWidget {
  final String title;
  final String imageUrl;
  

  const ExerciseRowInScreen({
    super.key,
    required this.title,
    required this.imageUrl,
    
  });

  @override
  State<ExerciseRowInScreen> createState() => _ExerciseRowInScreenState();
}

class _ExerciseRowInScreenState extends State<ExerciseRowInScreen> {
  int count = 1;

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Slidable(
        
        key: Key(widget.title),
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: ListTile(
            leading: widget.imageUrl.isNotEmpty
                ? SizedBox(height: 48,width: 48,child: CircleAvatar(backgroundImage: NetworkImage(widget.imageUrl)))
                : null,
            title: Text(widget.title),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.add_circle,size: 24,),
                  onPressed: () {
                    setState(() {
                      if(count<5) {
                        count++;
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
