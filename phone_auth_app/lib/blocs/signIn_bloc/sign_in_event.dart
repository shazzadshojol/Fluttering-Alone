part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  final String userEmail;
  final String userPassword;
  final bool isSubmitting;
  final bool isSubmitted;
  final String? errorMassage;

  const SignInEvent({
    this.isSubmitting = false,
    this.isSubmitted = false,
    this.errorMassage,
    required this.userEmail,
    required this.userPassword,
  });

  @override
  List<Object?> get props =>
      [userEmail, userPassword, isSubmitted, isSubmitting, errorMassage];
}

class SignInPressedEvent extends SignInEvent {
  const SignInPressedEvent({
    required super.userEmail,
    required super.userPassword,
  });

  @override
  List<Object?> get props => [userEmail, userPassword];
}
