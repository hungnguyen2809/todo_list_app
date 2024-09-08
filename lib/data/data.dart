import 'package:todo_list_app/contains/ui.dart';
import 'package:todo_list_app/data/model/onboarding.dart';

class OnboardingData {
  static List<Onboarding> listOnboarding = [
    Onboarding(
        title: "Manage your tasks",
        description: "You can easily manage all of your daily tasks in DoMe for free",
        image: UIContains.onboarding_1),
    Onboarding(
        title: "Create daily routine",
        description: "In UpTodo you can create your personalized routine to stay productive",
        image: UIContains.onboarding_2),
    Onboarding(
        title: "Organize your tasks",
        description: "You can organize your daily tasks by adding your tasks into separate categories",
        image: UIContains.onboarding_3),
  ];
}
