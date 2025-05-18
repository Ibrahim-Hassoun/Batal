import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import './conversation_screen_logic.dart';

class ConversationScreen extends StatefulWidget{
  final int conversationId;
  final int userId;
  final int secondPartyId;


  static String temp='';
  static final ScrollController scrollController = ScrollController();
  static bool isTyping = false;
  static bool loadingMessages = true;
  
  static final List<Map<String, dynamic>> messages = [
    
  ];
  const ConversationScreen({super.key, 
    required this.conversationId,
    required this.userId,
    required this.secondPartyId,
  });
  @override
  ConversationScreenState createState() => ConversationScreenState();
}

class ConversationScreenState extends State<ConversationScreen>{

  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            child: ConversationScreen.loadingMessages?
            Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [CircularProgressIndicator(color: primaryColor),Text('Loading messages')],))
            :
            ConversationScreen.messages.isEmpty?
            Center(child: Text('No messages yet'),):
            ListView.builder(
              controller: ConversationScreen.scrollController, 
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(16),
              itemCount: ConversationScreen.messages.length,
              itemBuilder: (context, index) {
                final message = ConversationScreen.messages[index];
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

      // Show arrow only after last chatbot message
      if (index == ConversationScreen.messages.length - 1  && ConversationScreen.isTyping)
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [CircularProgressIndicator(color: primaryColor,)]
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
                        ConversationScreen.temp = value;
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
                        ConversationScreen.temp = '';
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