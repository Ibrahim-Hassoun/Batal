import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/core/provider/AuthProvider.dart';
import 'package:mobile/lib/time_formatter/time_formatter.dart';
import 'package:mobile/main.dart';
import 'package:provider/provider.dart';
import './conversation_screen_logic.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConversationScreen extends StatefulWidget{
  final int conversationId;
  final int userId;
  final int secondPartyId;
  final String chatName;
  final String lastSeen;
  final String? imageURL;
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
    required this.chatName,
    required this.lastSeen,
    required this.imageURL,
  });
  @override
  ConversationScreenState createState() => ConversationScreenState();
}

class ConversationScreenState extends State<ConversationScreen>{
  
  final TextEditingController _controller = TextEditingController();
  late String token;
late WebSocketChannel channel;

@override
void initState() {
  super.initState();
  // Avoid using context here for Provider
  loadConvoMessages(); // You can still load basic setup here if it doesn't use context
}
  void loadConvoMessages ()async{
      loadMessages(widget.userId,this,widget.conversationId);
  }
@override
void didChangeDependencies() {
  super.didChangeDependencies();

  // Safe to use context here
  token = Provider.of<AuthProvider>(context, listen: true).access_token!;
  final String websocketURL = dotenv.env['WEBSOCKET_URL'] ?? '';
  channel = WebSocketChannel.connect(
    Uri.parse('$websocketURL?token=$token'),
  );

 channel.stream.listen((message) {
  print('Received: $message');

  final data = jsonDecode(message); // Now it's a Map
  if(int.parse(data['conversationId'])==widget.conversationId){
    setState(() {
    ConversationScreen.messages.insert(0, {
      'text': data['message'], // safely access the field now
      'isMe': false,
      'time': formatTimeAgo(DateTime.now()),
    });
    
  });
  WidgetsBinding.instance.addPostFrameCallback((_) {
        ConversationScreen.scrollController.animateTo(
          ConversationScreen.scrollController.position.minScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
}
  }
  );

}

  @override
  void dispose() {
   
    channel.sink.close();
    super.dispose();
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
            CircleAvatar(backgroundImage: NetworkImage(widget.imageURL ?? 'https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg')), // Add a default image
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.chatName, style: TextStyle(fontSize: 18)),
                Text(formatTimeAgo(DateTime.parse(widget.lastSeen)), style: TextStyle(fontSize: 12)),
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
              reverse: true,
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
                IconButton(icon: Icon(Icons.add), onPressed: () {}),
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