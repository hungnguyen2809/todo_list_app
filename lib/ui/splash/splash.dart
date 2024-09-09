import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/contains/ui.dart';
import 'package:todo_list_app/ui/onboarding/onboarding.dart';
import 'package:todo_list_app/ui/welcome/welcome.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _checkAppState(BuildContext context) async {
    final isCompleted = await _isOnboardingCompleted();
    if (isCompleted) {
      if (!context.mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const WelcomeScreen(isFirstInstall: false);
      }));
    } else {
      if (!context.mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const OnboardingScreen();
      }));
    }
  }

  Future<bool> _isOnboardingCompleted() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final result = prefs.getBool("onboarding_completed");
      return result ?? false;
    } catch (error) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkAppState(context);

    return Scaffold(
      backgroundColor: UIContains.blackBackground,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(UIContains.splash_image),
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
