import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth_app/blocs/signIn_bloc/sign_in_bloc.dart';
import 'package:phone_auth_app/screens/home_screen.dart';
import 'package:phone_auth_app/screens/signIn_signUp_screen/widgets/checkbox.dart';
import 'package:phone_auth_app/screens/signIn_signUp_screen/widgets/main_buttons.dart';
import 'package:phone_auth_app/screens/signIn_signUp_screen/widgets/social_buttons.dart';
import 'package:phone_auth_app/screens/signIn_signUp_screen/widgets/text_fields.dart';
import 'package:phone_auth_app/utils/constants/image_path.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocProvider(
            create: (context) => SignInBloc(),
            child: BlocListener<SignInBloc, SignInState>(
              listener: (context, state) {
                if (state.isSubmitting) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return const Center(child: CircularProgressIndicator());
                    },
                  );
                } else if (state.isSubmitted) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                      (context) => false);
                } else if (state.errorMassage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMassage!)));
                  Navigator.pop(context);
                }
              },
              child: BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      const SizedBox(height: 50),
                      Center(
                        child: Image.network(
                          ImagePath.appLogo,
                          height: 200,
                        ),
                      ),
                      const Text(
                        'Please Login',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      TextFields(
                        hintText: 'E-mail',
                        controller: context.read<SignInBloc>().emailController,
                        icon: const Icon(Icons.send),
                      ),
                      const SizedBox(height: 15),
                      TextFields(
                        hintText: 'Passwords',
                        controller:
                            context.read<SignInBloc>().passwordController,
                        icon: const Icon(Icons.password_outlined),
                        isPassword: true,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const MyCheckBox(
                            text: 'Remember me?',
                          ),
                          _buildForgetText(),
                        ],
                      ),
                      const SizedBox(height: 20),
                      MainButtons(
                        text: 'Sign In',
                        onTap: () {
                          final bloc = context.read<SignInBloc>();
                          bloc.add(SignInPressedEvent(
                            userEmail: bloc.emailController.text,
                            userPassword: bloc.passwordController.text,
                          ));
                        },
                      ),
                      const SizedBox(height: 20),
                      MainButtons(
                        text: 'Create Account',
                        color: Colors.transparent,
                        textColor: Colors.white,
                        onTap: () {},
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Or Sign in with',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 20),
                      const SocialButtons()
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextButton _buildForgetText() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'Forgot Passwords?',
        style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 14, color: Colors.blue),
      ),
    );
  }
}
