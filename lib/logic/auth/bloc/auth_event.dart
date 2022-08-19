part of 'auth_bloc.dart';

abstract class AuthEvent {}

class GetTokens extends AuthEvent {
  final String username;
  final String code;

  GetTokens(this.username, this.code);
}

class LogOutEvent extends AuthEvent {}
