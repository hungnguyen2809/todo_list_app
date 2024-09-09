import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/contains/ui.dart';

import '../../data/model/onboarding.dart';

class OnboardingView extends StatelessWidget {
  final int pageIndex;
  final Onboarding onboarding;
  final void Function()? onSkip;
  final void Function()? onNext;
  final void Function()? onBack;
  final void Function()? onStated;

  const OnboardingView({
    super.key,
    required this.pageIndex,
    required this.onboarding,
    required this.onSkip,
    required this.onNext,
    required this.onBack,
    required this.onStated,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIContains.blackBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSkipButton(),
              _buildOnboardingImage(),
              _buildOnboardingPageControl(),
              _buildOnboardingTitleContent(),
              _buildOnboardingNextPrevButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Container(
      margin: const EdgeInsets.only(top: 14, left: 20),
      alignment: AlignmentDirectional.centerStart,
      child: TextButton(
          onPressed: onSkip,
          child: Text(
            "skip".tr().toUpperCase(),
            style: TextStyle(
              fontSize: 16,
              fontFamily: UIContains.fontFamily,
              color: Colors.white.withOpacity(0.44),
            ),
          )),
    );
  }

  Widget _buildOnboardingImage() {
    return Image.asset(
      onboarding.image,
      width: 271,
      height: 296,
      fit: BoxFit.contain,
    );
  }

  _getColorIndicator(int index) {
    return pageIndex == index ? Colors.white : Colors.white.withOpacity(0.7);
  }

  Widget _buildOnboardingPageControl() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 26,
            height: 4,
            decoration: BoxDecoration(color: _getColorIndicator(0), borderRadius: BorderRadius.circular(56)),
          ),
          Container(
            width: 26,
            height: 4,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(color: _getColorIndicator(1), borderRadius: BorderRadius.circular(56)),
          ),
          Container(
            width: 26,
            height: 4,
            decoration: BoxDecoration(color: _getColorIndicator(2), borderRadius: BorderRadius.circular(56)),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingTitleContent() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 38),
      child: Column(
        children: [
          Text(
            onboarding.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontFamily: UIContains.fontFamily,
              color: Colors.white.withOpacity(0.87),
            ),
          ),
          const SizedBox(height: 42),
          Text(
            onboarding.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontFamily: UIContains.fontFamily,
              color: Colors.white.withOpacity(0.87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingNextPrevButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 107, bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: onBack,
              child: Text(
                "back".tr().toUpperCase(),
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: UIContains.fontFamily,
                  color: Colors.white.withOpacity(0.87),
                ),
              )),
          ElevatedButton(
              onPressed: () {
                if (pageIndex == 2) {
                  onStated?.call();
                } else {
                  onNext?.call();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: UIContains.colorPrimary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
              ),
              child: Text(
                pageIndex == 2 ? "get_stated".tr().toUpperCase() : "next".tr().toUpperCase(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: UIContains.fontFamily,
                ),
              )),
        ],
      ),
    );
  }
}
