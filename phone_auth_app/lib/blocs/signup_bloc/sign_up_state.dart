import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  final String firstName;
  final String lastName;
  final String userName;
  final String userEmail;
  final String userPhone;
  final String userPassword;
  final bool isSubmitting;
  final bool isSubmitted;
  final String? errorMessage;

  const SignUpState({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userPassword,
    this.isSubmitting = false,
    this.isSubmitted = false,
    this.errorMessage,
  });

  factory SignUpState.initial() {
    return const SignUpState(
      firstName: '',
      lastName: '',
      userName: '',
      userEmail: '',
      userPhone: '',
      userPassword: '',
    );
  }

  SignUpState copyWith({
    String? firstName,
    String? lastName,
    String? userName,
    String? userEmail,
    String? userPhone,
    String? userPassword,
    bool? isSubmitting,
    bool? isSubmitted,
    String? errorMessage,
  }) {
    return SignUpState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      userPhone: userPhone ?? this.userPhone,
      userPassword: userPassword ?? this.userPassword,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        userName,
        userEmail,
        userPhone,
        userPassword,
        isSubmitting,
        isSubmitted,
        errorMessage,
      ];
}
