
import 'package:flutter/material.dart';
import 'package:todo_list_app/contains/ui.dart';
import 'package:todo_list_app/data/model/onboarding.dart';

class AppData {
  static List<OnboardingModel> listOnboarding = [
    OnboardingModel(
        title: "Manage your tasks",
        description: "You can easily manage all of your daily tasks in DoMe for free",
        image: UIContains.onboarding_1),
    OnboardingModel(
        title: "Create daily routine",
        description: "In UpTodo you can create your personalized routine to stay productive",
        image: UIContains.onboarding_2),
    OnboardingModel(
        title: "Organize your tasks",
        description: "You can organize your daily tasks by adding your tasks into separate categories",
        image: UIContains.onboarding_3),
  ];

  static List<Color> listColor = [
    Colors.amber,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.pinkAccent,
    Colors.red,
    Colors.teal,
    const Color(0xFFC9CC41),
    const Color(0xFF66CC41),
    const Color(0xFF41CCA7),
    const Color(0xFF41A2CC),
    const Color(0xFFCC8441),
    const Color(0xFF4181CC),
    const Color(0xFF41CCA7),
    const Color(0xFF9741CC),
    const Color(0xFFCC4173),
  ];
}
