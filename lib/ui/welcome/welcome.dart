import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/contains/ui.dart';
import 'package:todo_list_app/ui/login/login.dart';
import 'package:todo_list_app/ui/register/register.dart';

class WelcomeScreen extends StatelessWidget {
  final bool isFirstInstall;

  const WelcomeScreen({super.key, required this.isFirstInstall});

  void _onBack(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIContains.blackBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: isFirstInstall
            ? IconButton(
                onPressed: () => _onBack(context),
                icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
              )
            : null,
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildContentPage(),
            const Spacer(),
            _buildLoginButton(context),
            _buildCreateButton(context),
            _buildTranslateButton(context),
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
            "welcome_title".tr(),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white.withOpacity(0.87), fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 26),
          Text(
            "welcome_description".tr(),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white.withOpacity(0.67), fontSize: 16),
          ),
        ],
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const LoginScreen();
    }));
  }

  Widget _buildLoginButton(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
        onPressed: () {
          _handleLogin(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: UIContains.colorPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        ),
        child: Text(
          "login".tr().toUpperCase(),
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  void _handleRegister(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const RegisterScreen();
    }));
  }

  Widget _buildCreateButton(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 28),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: OutlinedButton(
        onPressed: () {
          _handleRegister(context);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(width: 1, color: UIContains.colorPrimary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        ),
        child: Text(
          "create_account".tr().toUpperCase(),
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildTranslateButton(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 28),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              final lang = context.locale.toString();
              if (lang != 'vi') {
                context.setLocale(const Locale("vi"));
              }
            },
            icon: Image.asset(width: 24, height: 24, UIContains.lang_vi),
          ),
          Text(
            "or".tr().toLowerCase(),
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          IconButton(
              onPressed: () {
                final lang = context.locale.toString();
                if (lang != 'en') {
                  context.setLocale(const Locale("en"));
                }
              },
              icon: Image.asset(width: 24, height: 24, UIContains.lang_en))
        ],
      ),
    );
  }
}
