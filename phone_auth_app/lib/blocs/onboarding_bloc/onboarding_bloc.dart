import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth_app/blocs/onboarding_bloc/onboarding_event.dart';
import 'package:phone_auth_app/blocs/onboarding_bloc/onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState()) {
    on<PageChangedEvent>((event, emit) {
      emit(state.copyWith(currentPage: event.pageIndex));
    });

    on<NextPageEvent>((event, emit) {
      if (state.currentPage == 2) {
        emit(const SkipState());
      } else {
        emit(state.copyWith(currentPage: state.currentPage + 1));
      }
    });

    on<SkipEvent>((event, emit) {
      emit(SkipState());
    });
  }
}
