import 'package:flutter/material.dart';

class ExerciseRow extends StatefulWidget {
  final String title;
  final String imageUrl; // Optional image
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
    return Dismissible(
      key: Key(widget.title), // must be unique
      background: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            color: Colors.green,
            width: 60,
            alignment: Alignment.center,
            child: Icon(Icons.check, color: Colors.white),
          ),
          Container(
            color: Colors.red,
            width: 60,
            alignment: Alignment.center,
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ],
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        // You can handle logic here (e.g. remove item)
      },
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
