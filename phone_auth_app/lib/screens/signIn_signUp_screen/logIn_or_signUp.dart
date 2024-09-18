import 'package:flutter/material.dart';
import 'package:phone_auth_app/common/widgets/base_screen.dart';
import 'package:phone_auth_app/screens/signIn_signUp_screen/login_screen.dart';
import 'package:phone_auth_app/screens/signIn_signUp_screen/signup_screen.dart';

class LogInOrSignUpScreen extends StatefulWidget {
  const LogInOrSignUpScreen({super.key});

  @override
  State<LogInOrSignUpScreen> createState() => _LogInOrSignUpScreenState();
}

class _LogInOrSignUpScreenState extends State<LogInOrSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeaderLogo(),
            const SizedBox(height: 22),
            _buildCreateAccountButton(),
            const SizedBox(height: 14),
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderLogo() {
    return const Text(
      "Phone Auth",
      style: TextStyle(
          fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white),
    );
  }

  Widget _buildCreateAccountButton() {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignupScreen()));
        },
        child: const Padding(
          padding: EdgeInsets.all(18.0),
          child: Text(
            "Create Account",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return TextButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Log In",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
