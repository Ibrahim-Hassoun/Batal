import 'package:flutter/material.dart';
import 'package:mobile/main.dart';

class ChatRow extends StatefulWidget {
  final int chatId;
  final String chatName;
  final String lastMessage;
  final String lastMessageTime;
  final String? chatImageUrl;

  const ChatRow({
    Key? key,
    required this.chatId,
    required this.chatName,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.chatImageUrl,
  }) : super(key: key);
  
  @override
  State<ChatRow> createState() => _ChatRowState();
}

class _ChatRowState extends State<ChatRow>
{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16),
      child: 
         ListTile(
          

            leading: SizedBox(
            height: 45,
            width: 45,
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.chatImageUrl ?? 'https://randomuser.me/api/portraits'),
            ),
            ),
            
          
          title: Text(widget.chatName),
          subtitle: Text(widget.lastMessage),
          trailing: Text(widget.lastMessageTime,style: TextStyle(fontSize: 16,color: secondaryColor),),
          onTap: () {
            Navigator.pushNamed(context, '/conversation', );
          },
        ),
      
    );
  }
}