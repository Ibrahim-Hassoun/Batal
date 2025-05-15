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
      body: Stack(
        children: [
          Column(
            children:[
              SizedBox(height: 16,),
               ChatRow(chatId: 1, chatName: "Dani Sabbagh", lastMessage: "Eh hbb tamem", lastMessageTime: "1:43", chatImageUrl: 'https://media.boohoo.com/i/boohoo/amm07233_black_xl/male-black-man-active-performance-muscle-fit-raglan-tee?w=700&qlt=default&fmt.jp2.qlt=70&fmt=auto&sm=fit'),
               ChatRow(chatId: 1, chatName: "Hsen Shatila", lastMessage: "Mnshuf", lastMessageTime: "8:01", chatImageUrl: 'https://img.freepik.com/free-photo/front-view-fit-man-holding-dumbbells_23-2149517267.jpg?ga=GA1.1.624058667.1747277893&semt=ais_hybrid&w=740'),
               ChatRow(chatId: 1, chatName: "Rajaa Sayegh", lastMessage: "Alla ma3ooo", lastMessageTime: "8:50", chatImageUrl: 'https://images.pexels.com/photos/2294361/pexels-photo-2294361.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
               ChatRow(chatId: 1, chatName: "Alex Hunter", lastMessage: "mniha", lastMessageTime: "6:00", chatImageUrl: 'https://img.freepik.com/premium-photo/image-very-muscular-man-posing-with-naked-torso-studio-looking-black-background_157927-19852.jpg'),
               ChatRow(chatId: 1, chatName: "Johnny Eid", lastMessage: "Hello world", lastMessageTime: "9:00", chatImageUrl: 'https://img.freepik.com/free-photo/front-view-fit-man-holding-dumbbells_23-2149517267.jpg?ga=GA1.1.624058667.1747277893&semt=ais_hybrid&w=740'),
               ChatRow(chatId: 1, chatName: "Dani Sabbagh", lastMessage: "Eh hbb tamem", lastMessageTime: "1:43", chatImageUrl: 'https://media.boohoo.com/i/boohoo/amm07233_black_xl/male-black-man-active-performance-muscle-fit-raglan-tee?w=700&qlt=default&fmt.jp2.qlt=70&fmt=auto&sm=fit'),
               ChatRow(chatId: 1, chatName: "Hsen Shatila", lastMessage: "Mnshuf", lastMessageTime: "9:00", chatImageUrl: 'https://img.freepik.com/free-photo/front-view-fit-man-holding-dumbbells_23-2149517267.jpg?ga=GA1.1.624058667.1747277893&semt=ais_hybrid&w=740'),
               ChatRow(chatId: 1, chatName: "Rajaa Sayegh", lastMessage: "Alla ma3ooo", lastMessageTime: "9:00", chatImageUrl: 'https://images.pexels.com/photos/2294361/pexels-photo-2294361.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
               ChatRow(chatId: 1, chatName: "Alex Hunter", lastMessage: "mniha", lastMessageTime: "9:00", chatImageUrl: 'https://img.freepik.com/premium-photo/image-very-muscular-man-posing-with-naked-torso-studio-looking-black-background_157927-19852.jpg'),
               ChatRow(chatId: 1, chatName: "Johnny Eid", lastMessage: "Hello world", lastMessageTime: "9:00", chatImageUrl: 'https://img.freepik.com/free-photo/front-view-fit-man-holding-dumbbells_23-2149517267.jpg?ga=GA1.1.624058667.1747277893&semt=ais_hybrid&w=740'),
               
               ],
          ),
          Positioned(
            bottom: 128,
            right: 36,
            child: SizedBox(
              height: 64,
              width: 64,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/chatbot-conversation', );
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/Screenshot 2025-05-15 051340.png'),
                ),
              ),
            ),
            )
        ],
      ),
    );
  }
}