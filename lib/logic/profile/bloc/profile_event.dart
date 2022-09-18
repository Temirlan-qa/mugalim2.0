part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class ProfileLoad extends ProfileEvent {}

class ProfileInfoEdit extends ProfileEvent {}
//
// class ProfileChangePassword extends ProfileEvent {}

