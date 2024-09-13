import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/services/auth_service.dart';
import 'package:todo_list_app/ui/login/bloc/login_cubit.dart';
import 'package:todo_list_app/ui/navigation/navigation.dart';
import 'package:todo_list_app/ui/register/register.dart';

import '../../contains/ui.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: const LoginView(),
      create: (context) {
        return LoginCubit(authService: AuthService());
      },
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late bool _isDisabledBtn;
  late bool _passwordVisible;
  late String _username = '';
  late String _password = '';
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  final _formKey = GlobalKey<FormState>();
  late AutovalidateMode _isValidModeForm;

  @override
  void initState() {
    super.initState();

    _isDisabledBtn = true;
    _passwordVisible = false;
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();

    _isValidModeForm = AutovalidateMode.disabled;
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
      body: Form(
        key: _formKey,
        autovalidateMode: _isValidModeForm,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitleScreen(),
              _buildUsernameField(),
              _buildPasswordField(),
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
        "login".tr().toUpperCase(),
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
      ),
    );
  }

  void _checkDisableBtnLogin() {
    if (_isDisabledBtn && _username.isNotEmpty && _password.isNotEmpty) {
      setState(() {
        _isDisabledBtn = false;
      });
    }
    if (!_isDisabledBtn && (_username.isEmpty || _password.isEmpty)) {
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
          _buildTitleField("login_username".tr()),
          const SizedBox(height: 8),
          TextFormField(
            controller: _usernameController,
            onChanged: (text) {
              _username = text;
              _checkDisableBtnLogin();
            },
            validator: (String? text) {
              if (text == null || text.isEmpty) {
                return 'login_username_required'.tr();
              }
              return null;
            },
            style: const TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
              hintText: "login_username_hint".tr(),
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
      margin: const EdgeInsets.symmetric(horizontal: 38),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleField("login_password".tr()),
          const SizedBox(height: 8),
          TextFormField(
            controller: _passwordController,
            obscureText: !_passwordVisible,
            onChanged: (text) {
              _password = text;
              _checkDisableBtnLogin();
            },
            validator: (String? text) {
              if (text == null || text.isEmpty) {
                return 'login_password_required'.tr();
              }
              return null;
            },
            style: const TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
              hintText: "login_password_hint".tr(),
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

  void _handleLogin() {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    loginCubit.onLogin(_username.trim(), _password.trim());

    return;

    if (_isValidModeForm == AutovalidateMode.disabled) {
      setState(() {
        _isValidModeForm = AutovalidateMode.always;
      });
    }

    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const MainNavigation();
      }));
    }
  }

  void _handleRegister() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const RegisterScreen();
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
              onPressed: _handleLogin,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                backgroundColor: _isDisabledBtn ? UIContains.colorPrimary.withOpacity(0.5) : UIContains.colorPrimary,
              ),
              child: Text(
                "login".tr(),
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
                "login_with".tr(args: ['Google']),
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
                "login_with".tr(args: ['Apple']),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              text: "login_not_account".tr(),
              style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.87)),
              children: [
                const WidgetSpan(child: SizedBox(width: 5)),
                TextSpan(
                  text: "register".tr(),
                  recognizer: TapGestureRecognizer()..onTap = _handleRegister,
                  style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
