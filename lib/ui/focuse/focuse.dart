import 'package:flutter/material.dart';

import '../../contains/ui.dart';

class FocuseScreen extends StatefulWidget {
  const FocuseScreen({super.key});

  @override
  State<FocuseScreen> createState() => _FocuseScreenState();
}

class _FocuseScreenState extends State<FocuseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIContains.blackBackground,
      body: const Center(
        child: Text(
          "Focuse Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
