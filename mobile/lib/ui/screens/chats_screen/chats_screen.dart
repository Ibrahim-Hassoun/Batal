import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import 'package:mobile/ui/widgets/chats/chat_row.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: secondaryColor,),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: TextField(
            decoration: InputDecoration(
            
            hintText: 'Search',
            fillColor: bg_light_gray,
            filled: true,
            border: InputBorder.none,
              ),
              style: TextStyle(color: secondaryColor),
            ),
        ),
        backgroundColor: tertiaryColor,
      
      ),
      body: Column(
        children:[
          SizedBox(height: 16,),
           ChatRow(chatId: 1, chatName: "John Doe", lastMessage: "Hello world", lastMessageTime: "9:00", chatImageUrl: 'https://randomuser.me/api/portraits/men/1.jpg')
           
           ],
      ),
    );
  }
}