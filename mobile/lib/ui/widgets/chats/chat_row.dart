import 'package:flutter/material.dart';
import 'package:mobile/core/provider/AuthProvider.dart';
import 'package:mobile/lib/time_formatter/time_formatter.dart';
import 'package:mobile/main.dart';
import 'package:provider/provider.dart';
import '../../screens/chats_screen/conversation_screen.dart';

class ChatRow extends StatefulWidget {
  final int conversationId;
  final String chatName;
  final String lastMessage;
  final String lastMessageTime;
  final String? chatImageUrl;
  final int secondPartyId;

  const ChatRow({
    super.key,
    required this.conversationId,
    required this.chatName,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.chatImageUrl,
    required this.secondPartyId
  });
  
  @override
  State<ChatRow> createState() => _ChatRowState();
}

class _ChatRowState extends State<ChatRow>
{
  @override
  Widget build(BuildContext context) {
    int userId = Provider.of<AuthProvider>(context,listen: true).user!['id'];
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16),
      child: 
         ListTile(
          

            leading: SizedBox(
            height: 45,
            width: 45,
            child: GestureDetector(
              onTap: () =>{} ,
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.chatImageUrl ?? 'https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg'),
            ),
            )
            ),
            
          
          title: Text(widget.chatName),
          subtitle: Text(widget.lastMessage),
          trailing: Text(
            formatTimeAgo(DateTime.parse(widget.lastMessageTime)),
            style: TextStyle(fontSize: 16, color: secondaryColor),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConversationScreen(
                  userId: userId,
                  secondPartyId :widget.secondPartyId,
                  conversationId: widget.conversationId,
                  chatName:widget.chatName,
                  lastSeen:widget.lastMessageTime
                ),
              ),
            );
          },
        ),
      
    );
  }
}