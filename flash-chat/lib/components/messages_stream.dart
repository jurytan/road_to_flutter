import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/message_bubble.dart';
import 'package:flash_chat/services/login_service.dart';
import 'package:flutter/material.dart';

class MessagesStream extends StatelessWidget {
  static LoginService _login = LoginService();
  final _firestore = Firestore.instance;
  final _auth = _login.firebaseAuth;
  FirebaseUser loggedInUser = _login.user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('messages').orderBy('time').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents;
        String previousSender = '';
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.data['text'];
          final messageSender = message.data['sender'];

          final currentUser = loggedInUser.email;

          final messageWidget = MessageBubble(
            sender: messageSender,
            text: messageText,
            previousSender: previousSender,
            isMe: currentUser == messageSender,
          );
          previousSender = messageSender;
          messageBubbles.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles.reversed.toList(),
          ),
        );
      },
    );
  }
}
