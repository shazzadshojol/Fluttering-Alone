import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInBloc() : super(SignInState.initial()) {
    on<SignInPressedEvent>(_onSignInPressed);
  }

  void _onSignInPressed(
      SignInPressedEvent event, Emitter<SignInState> emit) async {
    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    try {
      await _auth.signInWithEmailAndPassword(
        email: event.userEmail,
        password: event.userPassword,
      );

      emit(state.copyWith(isSubmitted: true, isSubmitting: false));
    } on FirebaseException catch (e) {
      String errorMessage = 'Something went wrong';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Password didn\'t match';
      }

      emit(state.copyWith(isSubmitting: false, errorMessage: errorMessage));
    } catch (e) {
      emit(state.copyWith(
          isSubmitting: false, errorMessage: 'Unexpected error occurred'));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
