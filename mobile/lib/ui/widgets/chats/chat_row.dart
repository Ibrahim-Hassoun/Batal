import 'package:flutter/material.dart';

class ChatRow extends StatefulWidget {
  const ChatRow({Key? key}) : super(key: key);

  @override
  State<ChatRow> createState() => _ChatRowState();
}

class _ChatRowState extends State<ChatRow>
{
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage('https://example.com/image.jpg'),
      ),
      title: Text('Chat Title'),
      subtitle: Text('Last message preview'),
      trailing: Text('12:00 PM'),
      onTap: () {
        
      },
    );
  }
}