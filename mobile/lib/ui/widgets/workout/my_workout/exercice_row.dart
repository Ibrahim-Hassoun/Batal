import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExerciseRow extends StatefulWidget {
  final String title;
  final String imageUrl;
  final int initialCount;

  const ExerciseRow({
    super.key,
    required this.title,
    required this.imageUrl,
    this.initialCount = 1,
  });

  @override
  State<ExerciseRow> createState() => _ExerciseRowState();
}

class _ExerciseRowState extends State<ExerciseRow> {
  int count = 1;

  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(widget.title),
      endActionPane: ActionPane(
        motion: const DrawerMotion(), // You can use StretchMotion or others too
        extentRatio: 0.4, // 40% of the width
        children: [
          SlidableAction(
            onPressed: (context) {
              // Confirm action
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${widget.title} confirmed')),
              );
            },
            backgroundColor: Colors.green,
            icon: Icons.check,
            label: 'Confirm',
          ),
          SlidableAction(
            onPressed: (context) {
              // Delete action (doesn't remove the widget)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${widget.title} delete clicked')),
              );
            },
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        leading: widget.imageUrl.isNotEmpty
            ? CircleAvatar(backgroundImage: NetworkImage(widget.imageUrl))
            : null,
        title: Text(widget.title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                setState(() {
                  if (count > 0) count--;
                });
              },
            ),
            Text(count.toString(), style: TextStyle(fontSize: 16)),
            IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () {
                setState(() {
                  count++;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
