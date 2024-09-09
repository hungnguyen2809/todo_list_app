import 'package:flutter/material.dart';

import '../../contains/ui.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIContains.blackBackground,
      body: const Center(
        child: Text(
          "Calendar Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
