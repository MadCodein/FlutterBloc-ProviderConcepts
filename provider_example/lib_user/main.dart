import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (_) => UserProvider(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providerService = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("State Management"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Text",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  providerService.updateUi = value;
                },
              ),
              SizedBox(height: 10),
              Text(
                providerService.username.toString(),
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
