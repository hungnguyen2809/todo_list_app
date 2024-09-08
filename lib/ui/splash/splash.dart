import 'package:flutter/material.dart';
import 'package:todo_list_app/contains/ui.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIContains.blackBackground,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(UIContains.splashImage),
              const SizedBox(height: 20),
              Text(
                "UpTodo",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: UIContains.fontFamily,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
