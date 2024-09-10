import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/ui/login/login.dart';

import '../../contains/ui.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late bool _isDisabledBtn;
  late bool _passwordVisible;
  late bool _confPasswordVisible;
  late String _username = '';
  late String _password = '';
  late String _confPassword = '';
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late TextEditingController _confPasswordController;

  @override
  void initState() {
    super.initState();

    _isDisabledBtn = true;
    _passwordVisible = false;
    _confPasswordVisible = false;
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _confPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIContains.blackBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitleScreen(),
              _buildUsernameField(),
              _buildPasswordField(),
              _buildConfPasswordField(),
              _buildActionButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleScreen() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 38).copyWith(top: 41, bottom: 53),
      child: Text(
        "register".tr().toUpperCase(),
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
      ),
    );
  }

  void _checkDisableBtnLogin() {
    if (_isDisabledBtn && _username.isNotEmpty && _password.isNotEmpty && _confPassword.isNotEmpty) {
      setState(() {
        _isDisabledBtn = false;
      });
    }
    if (!_isDisabledBtn && (_username.isEmpty || _password.isEmpty || _confPassword.isEmpty)) {
      setState(() {
        _isDisabledBtn = true;
      });
    }
  }

  Widget _buildTitleField(String title) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: const TextStyle(fontSize: 16, color: Colors.white),
    );
  }

  Widget _buildUsernameField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 38).copyWith(bottom: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleField("register_username".tr()),
          const SizedBox(height: 8),
          TextFormField(
            controller: _usernameController,
            onChanged: (text) {
              _username = text;
              _checkDisableBtnLogin();
            },
            style: const TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
              hintText: "register_username_hint".tr(),
              hintStyle: const TextStyle(fontSize: 16, color: Color(0xFFAFAFAF)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(width: 1, color: Color(0xFF979797)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 38).copyWith(bottom: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleField("register_password".tr()),
          const SizedBox(height: 8),
          TextFormField(
            controller: _passwordController,
            obscureText: !_passwordVisible,
            onChanged: (text) {
              _password = text;
              _checkDisableBtnLogin();
            },
            style: const TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
              hintText: "register_password_hint".tr(),
              hintStyle: const TextStyle(fontSize: 16, color: Color(0xFFAFAFAF)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(width: 1, color: Color(0xFF979797)),
              ),
              suffixIcon: IconButton(
                icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off, color: const Color(0xFFAFAFAF)),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfPasswordField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 38),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleField("register_password_conf".tr()),
          const SizedBox(height: 8),
          TextFormField(
            controller: _confPasswordController,
            obscureText: !_confPasswordVisible,
            onChanged: (text) {
              _confPassword = text;
              _checkDisableBtnLogin();
            },
            style: const TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
              hintText: "register_password_conf_hint".tr(),
              hintStyle: const TextStyle(fontSize: 16, color: Color(0xFFAFAFAF)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(width: 1, color: Color(0xFF979797)),
              ),
              suffixIcon: IconButton(
                icon: Icon(_confPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xFFAFAFAF)),
                onPressed: () {
                  setState(() {
                    _confPasswordVisible = !_confPasswordVisible;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleLogin() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const LoginScreen();
    }));
  }

  Widget _buildActionButtons(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 38).copyWith(top: 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 48,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                backgroundColor: _isDisabledBtn ? UIContains.colorPrimary.withOpacity(0.5) : UIContains.colorPrimary,
              ),
              child: Text(
                "register".tr(),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 31, bottom: 29),
            child: Text(
              "or".tr().toLowerCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          Container(
            height: 48,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 20),
            child: OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: BorderSide(color: UIContains.colorPrimary),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
              ),
              icon: Image.asset(width: 24, height: 24, UIContains.ic_google, fit: BoxFit.contain),
              label: Text(
                "register_with".tr(args: ['Google']),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          Container(
            height: 48,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 46),
            child: OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: BorderSide(color: UIContains.colorPrimary),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
              ),
              icon: Image.asset(width: 24, height: 24, UIContains.ic_apple, fit: BoxFit.contain),
              label: Text(
                "register_with".tr(args: ['Apple']),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: Text(
                  "register_have_account".tr(),
                  style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.87)),
                ),
              ),
              GestureDetector(
                onTap: _handleLogin,
                child: Text(
                  "login".tr(),
                  style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
