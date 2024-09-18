import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth_app/blocs/signup_bloc/sign_up_state.dart';

part 'sign_up_event.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpBloc() : super(SignUpState.initial()) {
    on<FirstNameEvent>(_firstName);
    on<LastNameEvent>(_lastName);
    on<UserNameEvent>(_userName);
    on<UserEmailEvent>(_userEmail);
    on<UserPhoneEvent>(_userPhone);
    on<UserPasswordEvent>(_userPassword);
    on<SignUpPressed>(_signUpCalled);
    on<OnSignUpSubmitted>(_signUpSubmitted);

    firstNameController
        .addListener(() => add(FirstNameEvent(firstNameController.text)));

    lastNameController
        .addListener(() => add(LastNameEvent(lastNameController.text)));

    lastNameController
        .addListener(() => add(LastNameEvent(lastNameController.text)));

    userNameController
        .addListener(() => add(UserNameEvent(userNameController.text)));

    emailController
        .addListener(() => add(UserEmailEvent(emailController.text)));

    phoneController
        .addListener(() => add(UserPhoneEvent(phoneController.text)));

    passwordController
        .addListener(() => add(UserPasswordEvent(passwordController.text)));
  }

  void _firstName(FirstNameEvent event, Emitter<SignUpState> emit) {
    // emit(state..firstName = event.firstName); advance way of writing learning.
    // But best practice is use copyWith method.
    emit(state.copyWith(firstName: event.firstName));
  }

  void _lastName(LastNameEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(lastName: event.lastName));
  }

  void _userName(UserNameEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  void _userEmail(UserEmailEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(userEmail: event.userEmail));
  }

  void _userPhone(UserPhoneEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(userPhone: event.userPhone));
  }

  void _userPassword(UserPasswordEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(userPassword: event.userPassword));
  }

  void _signUpCalled(SignUpPressed event, Emitter<SignUpState> emit) {
    try {
      emit(state.copyWith(isSubmitting: false, isSubmitted: true));
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, errorMessage: 'Signup failed'));
    }
  }

  void _signUpSubmitted(
      OnSignUpSubmitted event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(isSubmitted: true));

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: state.userEmail, password: state.userPassword);

      await _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'firstName': state.firstName,
        'lastName': state.lastName,
        'userName': state.userName,
        'userEmail': state.userEmail,
        'userPhone': state.userPhone,
        'userPassword': state.userPassword,
      });

      emit(state.copyWith(isSubmitting: true, isSubmitted: true));
    } on FirebaseException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'weak-password':
          errorMessage = 'Put a strong password';
          break;

        case 'email-already-in-use':
          errorMessage = 'Email already used';
          break;
        default:
          errorMessage = 'Something went wrong: ${e.toString()}';
      }
      emit(state.copyWith(isSubmitting: false, errorMessage: errorMessage));
    } catch (e) {
      emit(state.copyWith(
          isSubmitting: false,
          errorMessage: 'Critical error: ${e.toString()}'));
    }
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
