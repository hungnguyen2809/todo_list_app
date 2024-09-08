import 'package:flutter/material.dart';
import 'package:todo_list_app/contains/ui.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIContains.blackBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.white)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildContentPage(),
            const Spacer(),
            _buildLoginButton(),
            _buildCreateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildContentPage() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 38, vertical: 58),
      child: Column(
        children: [
          Text(
            "Welcome to UpTodo",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white.withOpacity(0.87), fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 26),
          Text(
            "Please login to your account or create new account to continue",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white.withOpacity(0.67), fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      height: 48,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: UIContains.colorPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        ),
        child: const Text(
          "LOGIN",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildCreateButton() {
    return Container(
      height: 48,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 28),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(width: 1, color: UIContains.colorPrimary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        ),
        child: const Text(
          "CREATE ACCOUNT",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
