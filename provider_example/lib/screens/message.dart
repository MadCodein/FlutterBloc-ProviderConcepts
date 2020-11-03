import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../appBarComponent.dart';
import 'myapp.dart';
import '../provider/message_provider.dart';

class Message extends StatelessWidget {
  final String subject;
  final String message;

  Message({Key key, this.subject, this.message});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MessageProvider>(context);
    return Scaffold(
      appBar: buildAppBarComponent(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Subject",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                subject,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Message",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                message,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        FlatButton(
          onPressed: () {
            provider.done;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => MyApp(),
              ),
            );
          },
          child: Text(
            "Go Back",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
