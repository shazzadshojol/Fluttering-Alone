import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth_app/blocs/onboarding_bloc/onboarding_bloc.dart';
import 'package:phone_auth_app/blocs/signIn_bloc/sign_in_bloc.dart';
import 'package:phone_auth_app/blocs/signup_bloc/sign_up_bloc.dart';
import 'package:phone_auth_app/screens/onboarding_screens/onboarding_screen.dart';
import 'package:phone_auth_app/utils/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnboardingBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => SignUpBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const OnboardingScreen(),
        themeMode: ThemeMode.dark,
        theme: MyAppTheme.lightTheme,
        darkTheme: MyAppTheme.darkTheme,
      ),
    );
  }
}
