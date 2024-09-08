import 'package:flutter/material.dart';
import 'package:todo_list_app/data/data.dart';
import 'package:todo_list_app/ui/onboarding/onboarding_view.dart';
import 'package:todo_list_app/ui/welcome/welcome.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _changePageController(int index) {
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  void _onStated() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const WelcomeScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const ClampingScrollPhysics(),
        children: [
          OnboardingView(
            onboarding: OnboardingData.listOnboarding[0],
            pageIndex: 0,
            onSkip: _onStated,
            onBack: null,
            onNext: () {
              _changePageController(1);
            },
            onStated: null,
          ),
          OnboardingView(
            onboarding: OnboardingData.listOnboarding[1],
            pageIndex: 1,
            onSkip: _onStated,
            onBack: () {
              _changePageController(0);
            },
            onNext: () {
              _changePageController(2);
            },
            onStated: null,
          ),
          OnboardingView(
            onboarding: OnboardingData.listOnboarding[2],
            pageIndex: 2,
            onSkip: _onStated,
            onBack: () {
              _changePageController(1);
            },
            onNext: null,
            onStated: _onStated,
          ),
        ],
      ),
    );
  }
}
