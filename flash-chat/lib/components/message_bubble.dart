import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, this.previousSender, this.isMe});

  final String sender;
  final String previousSender;
  final bool isMe;
  final String text;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    if (previousSender != sender) {
      widgets.add(Text(
        sender,
        style: TextStyle(
          fontSize: 12.0,
          color: Colors.black54,
        ),
      ));
    }
    widgets.add(
      Material(
        elevation: 4.0,
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              )
            : BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
        color: isMe ? Colors.lightBlueAccent : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Text(
            text,
            style: TextStyle(
              color: isMe ? Colors.white : Colors.black54,
            ),
          ),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: widgets,
      ),
    );
  }
}
