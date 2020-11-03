import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/message_provider.dart';
import 'screens/myapp.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => MessageProvider(),
        child: MaterialApp(
          home: MyApp(),
        ),
      ),
    );
