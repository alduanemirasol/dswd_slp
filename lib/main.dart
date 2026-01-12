import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_models/security_question_view_model.dart';
import 'views/security_question_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SecurityQuestionViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Security Questions Demo',
      home: SecurityQuestionScreen(),
    );
  }
}
