
part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}


class GetTokensSuccess extends AuthState {
  final AuthTokensModel authTokensModel;

  GetTokensSuccess(this.authTokensModel);
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}

class NotAuthenticatedState extends AuthState {}
