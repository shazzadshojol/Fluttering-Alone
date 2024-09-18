import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int currentPage;

  const OnboardingState({this.currentPage = 0});

  OnboardingState copyWith({int? currentPage}) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [currentPage];
}

class SkipState extends OnboardingState {
  const SkipState();
}
