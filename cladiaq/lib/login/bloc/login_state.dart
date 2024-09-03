part of 'login_bloc.dart';

@immutable
class LoginState {}

class LoginInitial extends LoginState {}

class LoginPasswordShow extends LoginState {
  final bool show = false;
}
