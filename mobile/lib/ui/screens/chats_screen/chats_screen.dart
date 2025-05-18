import 'package:flutter/material.dart';
import 'package:mobile/core/provider/AuthProvider.dart';
import 'package:mobile/core/provider/chat_provider.dart';
import 'package:mobile/main.dart';
import 'package:mobile/ui/widgets/chats/chat_row.dart';
import 'package:provider/provider.dart';
import './chats_screen_logic.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => ChatsScreenState();
}

class ChatsScreenState extends State<ChatsScreen> {
  bool loading = true;
  List<dynamic> conversations = [];

  @override
  void initState() {

    super.initState();
    loadChats();

  }
  void loadChats()async{
    conversations = await fetchChats(this);
    setState(() {
      
    });
  }

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
      body: 
      loading? 
      Center(child: CircularProgressIndicator(color: primaryColor,))
      :
      Stack(
        children: [
          Column(
            children:[
              SizedBox(height: 16,),
              

              ListView.builder(
              physics: const NeverScrollableScrollPhysics(), 
              shrinkWrap: true,
              
              itemCount: conversations!.length,
              itemBuilder: (context,index){
                 var convoData = conversations[index]; 
                 return  ChatRow(chatId: 1, chatName: "Dani Sabbagh", lastMessage: "Eh hbb tamem", lastMessageTime: "1:43", chatImageUrl: 'https://media.boohoo.com/i/boohoo/amm07233_black_xl/male-black-man-active-performance-muscle-fit-raglan-tee?w=700&qlt=default&fmt.jp2.qlt=70&fmt=auto&sm=fit');
              },
            )
              
              
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