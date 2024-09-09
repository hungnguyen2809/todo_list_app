import 'package:flutter/material.dart';

import '../../contains/ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIContains.blackBackground,
      body: const Center(
        child: Text(
          "Home Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
