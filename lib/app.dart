import 'package:flutter/material.dart';
import 'package:todo_list_app/contains/ui.dart';
import 'package:todo_list_app/ui/onboarding/onboarding.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: UIContains.fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const OnboardingScreen(),
    );
  }
}
