part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final String userEmail;
  final String userPassword;
  final bool isSubmitting;
  final bool isSubmitted;
  final String? errorMassage;

  const SignInState({
    required this.userEmail,
    required this.userPassword,
    this.isSubmitting = false,
    this.isSubmitted = false,
    this.errorMassage,
  });

  factory SignInState.initial() {
    return const SignInState(
      userEmail: '',
      userPassword: '',
    );
  }

  SignInState copyWith({
    String? userEmail,
    String? userPassword,
    bool? isSubmitting,
    bool? isSubmitted,
    String? errorMessage,
  }) {
    return SignInState(
        userEmail: userEmail ?? this.userEmail,
        userPassword: userPassword ?? this.userPassword,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isSubmitted: isSubmitted ?? this.isSubmitted,
        errorMassage: errorMessage ?? errorMassage);
  }

  @override
  List<Object?> get props =>
      [userEmail, userPassword, isSubmitting, isSubmitted, errorMassage];
}
