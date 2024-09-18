import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth_app/blocs/onboarding_bloc/onboarding_bloc.dart';
import 'package:phone_auth_app/blocs/onboarding_bloc/onboarding_event.dart';
import 'package:phone_auth_app/blocs/onboarding_bloc/onboarding_state.dart';
import 'package:phone_auth_app/common/widgets/base_screen.dart';
import 'package:phone_auth_app/screens/onboarding_screens/widgets/dot_navigator.dart';
import 'package:phone_auth_app/screens/onboarding_screens/widgets/next_button.dart';
import 'package:phone_auth_app/screens/onboarding_screens/widgets/onboarding_pages.dart';
import 'package:phone_auth_app/screens/onboarding_screens/widgets/skip_button.dart';
import 'package:phone_auth_app/screens/signIn_signUp_screen/logIn_or_signUp.dart';
import 'package:phone_auth_app/utils/constants/image_path.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        child: Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            BlocBuilder<OnboardingBloc, OnboardingState>(
              builder: (context, state) {
                return PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    context.read<OnboardingBloc>().add(PageChangedEvent(index));
                  },
                  children: const [
                    OnboardingPages(
                      image: ImagePath.onboardingImage1,
                      title: 'Welcome',
                      subTitle: 'To Auth App',
                    ),
                    OnboardingPages(
                      image: ImagePath.onboardingImage2,
                      title: 'Welcome',
                      subTitle: 'To the page',
                    ),
                    OnboardingPages(
                      image: ImagePath.onboardingImage3,
                      title: 'Welcome',
                      subTitle: 'To the page',
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: NextButton(
                onTap: () {
                  context.read<OnboardingBloc>().add(NextPageEvent());
                },
              ),
            ),
            BlocListener<OnboardingBloc, OnboardingState>(
              listener: (context, state) {
                if (state is SkipState) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LogInOrSignUpScreen()),
                      (_) => false);
                } else {
                  _pageController.animateToPage(state.currentPage,
                      duration: Duration(microseconds: 20),
                      curve: Curves.easeInOut);
                }
              },
              child: BlocBuilder<OnboardingBloc, OnboardingState>(
                builder: (context, state) {
                  return DotNavigation(
                      pageController: _pageController,
                      visitNextPage: (index) {
                        _pageController.animateToPage(index,
                            duration: const Duration(microseconds: 20),
                            curve: Curves.easeInOut);
                      });
                },
              ),
            ),
            SkipButton(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LogInOrSignUpScreen()),
                    (_) => false);
              },
            )
          ],
        ),
      ),
    ));
  }
}
