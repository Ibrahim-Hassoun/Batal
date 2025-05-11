import 'package:flutter/material.dart';
import 'package:mobile/main.dart';


class ConversationScreen extends StatefulWidget {
  final int chatId;
  final String chatName;
  final List<String> chatMessages;
  final DateTime? lastSeen;
  final String? chatImageUrl;

  const ConversationScreen({
    super.key,
    required this.chatId,
    required this.chatName,
    required this.chatMessages,
    required this.lastSeen,
    this.chatImageUrl,
  });

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}


class _ConversationScreenState extends State<ConversationScreen> {
  final List<Map<String, dynamic>> messages = [
    {'text': 'This is the main chat template', 'isMe': true, 'time': 'Nov 30, 2023, 9:41 AM'},
    {'text': 'Oh?', 'isMe': false},
    {'text': 'Cool', 'isMe': false},
    {'text': 'How does it work?', 'isMe': false},
    {'text': 'You just edit any text to type in the conversation you want to show, and delete any bubbles you don’t want to use', 'isMe': true},
    {'text': 'Boom!', 'isMe': true},
    {'text': 'Hmmm', 'isMe': false},
    {'text': 'I think I get it', 'isMe': false},
    {'text': 'Will head to the Help Center if I have more questions tho', 'isMe': false},
    {'text': 'Sure thing! I’m here to help', 'isMe': true},
    {'text': 'Thanks!', 'isMe': false},
    {'text': 'No problem', 'isMe': true},
    {'text': 'See you around!', 'isMe': false},
    {'text': 'Bye!', 'isMe': true},
    {'text': 'See ya!', 'isMe': false},
  ];
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
            CircleAvatar(backgroundImage: AssetImage('assets/avatar.png')), // Add a default image
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
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.mic), onPressed: () {}),
                IconButton(icon: Icon(Icons.image), onPressed: () {}),
                IconButton(icon: Icon(Icons.add), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    
    );
  }
}