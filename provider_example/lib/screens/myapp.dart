import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../appBarComponent.dart';
import '../provider/message_provider.dart';
import 'message.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MessageProvider>(context);

    return Scaffold(
      appBar: buildAppBarComponent(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Subject:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                maxLength: 25,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  errorText: provider.subject.error,
                ),
                onChanged: (value) {
                  provider.subjectInput = value;
                },
              ),
              SizedBox(height: 15),
              Text(
                "Message:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                minLines: 5,
                maxLines: 10,
                maxLength: 500,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  errorText: provider.message.error,
                ),
                onChanged: (value) {
                  provider.messageInput = value;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: !provider.isValid
          ? null
          : FloatingActionButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Message(
                        subject: provider.subject.value,
                        message: provider.message.value),
                  ),
                );
              },
              child: Icon(Icons.send),
            ),
    );
  }
}
