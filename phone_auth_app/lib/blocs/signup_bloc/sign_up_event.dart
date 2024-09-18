part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class FirstNameEvent extends SignUpEvent {
  final String firstName;

  const FirstNameEvent(this.firstName);

  @override
  List<Object?> get props => [firstName];
}

class LastNameEvent extends SignUpEvent {
  final String lastName;

  const LastNameEvent(this.lastName);

  @override
  List<Object?> get props => [lastName];
}

class UserNameEvent extends SignUpEvent {
  final String userName;

  const UserNameEvent(this.userName);

  @override
  List<Object?> get props => [userName];
}

class UserEmailEvent extends SignUpEvent {
  final String userEmail;

  const UserEmailEvent(this.userEmail);

  @override
  List<Object?> get props => [userEmail];
}

class UserPhoneEvent extends SignUpEvent {
  final String userPhone;

  const UserPhoneEvent(this.userPhone);

  @override
  List<Object?> get props => [userPhone];
}

class UserPasswordEvent extends SignUpEvent {
  final String userPassword;

  const UserPasswordEvent(this.userPassword);

  @override
  List<Object?> get props => [userPassword];
}

class SignUpPressed extends SignUpEvent {
  final String firstName;
  final String lastName;
  final String userName;
  final String userEmail;
  final String userPhone;
  final String userPassword;
  final bool isSubmitting;
  final bool isSubmitted;
  final String? errorMassage;

  const SignUpPressed({
    required this.firstName,
    required this.lastName,
    required this.userEmail,
    required this.userName,
    required this.userPhone,
    required this.userPassword,
    this.isSubmitting = false,
    this.isSubmitted = false,
    this.errorMassage,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        userName,
        userEmail,
        userPhone,
        userPassword,
        isSubmitted,
        isSubmitting,
        errorMassage
      ];
}

class OnSignUpSubmitted extends SignUpEvent {
  @override
  List<Object?> get props => [];
}
