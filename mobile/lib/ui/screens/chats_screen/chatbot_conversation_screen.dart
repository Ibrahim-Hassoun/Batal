import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import '../.../../../../core/remote/server.dart';
import './chatbot_logic.dart';

class ChatbotConversationScreen extends StatefulWidget {
  final int chatId;
  final String chatName;
  final List<String> chatMessages;
  final DateTime? lastSeen;
  final String? chatImageUrl;



  static String temp='';
  static final ScrollController scrollController = ScrollController();
  
  ChatbotConversationScreen({
    super.key,
    required this.chatId,
    required this.chatName,
    required this.chatMessages,
    required this.lastSeen,
    this.chatImageUrl,
  });
  
  @override
  State<ChatbotConversationScreen> createState() => ChatbotConversationScreenState();
}


class ChatbotConversationScreenState extends State<ChatbotConversationScreen> {
  

  static final List<Map<String, dynamic>> messages = [
    {'text': 'This is the main chat template', 'isMe': true, 'time': 'Nov 30, 2023, 9:41 AM'},
    {'text': 'Oh?', 'isMe': false},
    
  ];
  


 
TextEditingController _controller = TextEditingController();



  @override
void initState() {
  super.initState();
  _controller.text = ChatbotConversationScreen.temp;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
       title: Row(
          children: [
            // CircleAvatar(backgroundImage: NetworkImage(widget.chatImageUrl ?? 'https://randomuser.me/api/portraits')), // Add a default image
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('John Doe', style: TextStyle(fontSize: 18)),
                Text('Active 11m ago', style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert,color: secondaryColor,),
            onPressed: () {
              // Handle video call action
            },
          ),
          
        ],),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: ChatbotConversationScreen.scrollController, 
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isMe = message['isMe'];
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment:
                        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      if (message.containsKey('time'))
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            message['time'],
                            style: TextStyle(fontSize: 12, color: bg_gray),
                          ),
                        ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        padding: EdgeInsets.all(12),
                        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.grey.shade300 : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          message['text'],
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
            child: Row(
              children: [
                IconButton(icon: Icon(Icons.refresh), onPressed: () {clearChat(this);}),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        ChatbotConversationScreen.temp = value;
                      });
                    },
                    
                    controller: _controller,
                    decoration: InputDecoration(
                      
                      hintText: "Message..." ,
                      border: InputBorder.none,
                      
                    ),
                  ),
                ),
                
                IconButton(icon: Icon(Icons.send), onPressed: ()=> {
                      setState(() {
                        
                        sendMessage(this);
                        _controller.clear();
                        ChatbotConversationScreen.temp = '';
                      })
                    },),
              ],
            ),
          ),
        ],
      ),
    
    );
  }
}