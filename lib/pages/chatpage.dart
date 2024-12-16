import 'package:flutter/material.dart';
import 'package:flutter_chatbot/pages/chatpage.dart';
import 'package:flutter_chatbot/services/gpt.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  ChatUser me = ChatUser(id: "1");
  ChatUser bot = ChatUser(id: "2");


List<ChatMessage> messageList = [];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: DashChat(
        currentUser: me, onSend: (newMessage) async{
        messageList.insert(0, newMessage);
        setState(() {});
        String content = await Gpt().getData(newMessage.text);

        ChatMessage botMessage = ChatMessage(user: bot, createdAt: DateTime.now(),
        text: content,);
        messageList.insert(0, botMessage);  
        setState(() {
          
        });       
      }, messages:messageList ,
       
      ),
    );
  }
}