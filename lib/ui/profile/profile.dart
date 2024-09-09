import 'package:flutter/material.dart';

import '../../contains/ui.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIContains.blackBackground,
      body: const Center(
        child: Text(
          "Profile Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
