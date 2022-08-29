part of 'profile_bloc.dart';

//@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileFailure extends ProfileState {
}

class ProfileSuccess extends ProfileState {
}

class NotificationSuccess extends ProfileState {
}