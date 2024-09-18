import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth_app/blocs/signup_bloc/sign_up_bloc.dart';
import 'package:phone_auth_app/blocs/signup_bloc/sign_up_state.dart';
import 'package:phone_auth_app/screens/signIn_signUp_screen/login_screen.dart';
import 'package:phone_auth_app/screens/signIn_signUp_screen/widgets/checkbox.dart';
import 'package:phone_auth_app/screens/signIn_signUp_screen/widgets/main_buttons.dart';
import 'package:phone_auth_app/screens/signIn_signUp_screen/widgets/rich_text.dart';
import 'package:phone_auth_app/screens/signIn_signUp_screen/widgets/social_buttons.dart';
import 'package:phone_auth_app/screens/signIn_signUp_screen/widgets/text_fields.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocProvider(
            create: (context) => SignUpBloc(),
            child: BlocListener<SignUpBloc, SignUpState>(
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
                          builder: (context) => const LoginScreen()),
                      (context) => false);
                } else if (state.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage!)));
                }
              },
              child: BlocBuilder<SignUpBloc, SignUpState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      const SizedBox(height: 50),
                      const Text(
                        'Sign Up Now',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        children: [
                          SizedBox(
                            width: 160,
                            child: TextFields(
                                hintText: 'First Name',
                                controller: context
                                    .read<SignUpBloc>()
                                    .firstNameController,
                                icon: const Icon(Icons.person)),
                          ),
                          const SizedBox(width: 25),
                          SizedBox(
                            width: 160,
                            child: TextFields(
                              hintText: 'Last Name',
                              controller:
                                  context.read<SignUpBloc>().lastNameController,
                              icon: const Icon(Icons.person),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextFields(
                        hintText: 'Username',
                        controller:
                            context.read<SignUpBloc>().userNameController,
                        icon: const Icon(Icons.account_circle_outlined),
                      ),
                      const SizedBox(height: 10),
                      TextFields(
                        hintText: 'E-mail',
                        controller: context.read<SignUpBloc>().emailController,
                        icon: const Icon(Icons.send),
                      ),
                      const SizedBox(height: 15),
                      TextFields(
                        hintText: 'Phone',
                        controller: context.read<SignUpBloc>().phoneController,
                        icon: const Icon(Icons.phone),
                      ),
                      const SizedBox(height: 15),
                      TextFields(
                        hintText: 'Passwords',
                        controller:
                            context.read<SignUpBloc>().passwordController,
                        icon: const Icon(Icons.password_outlined),
                        isPassword: true,
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [MyCheckBox(), AgreeToTerms()],
                      ),
                      const SizedBox(height: 20),
                      MainButtons(
                        text: 'Create Account',
                        onTap: () {
                          print('Clicked');

                          context.read<SignUpBloc>().add(OnSignUpSubmitted());
                        },
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
}
