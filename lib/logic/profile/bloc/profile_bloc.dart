import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final Box tokensBox = Hive.box('tokens');
  ProfileBloc() : super(ProfileInitial()){}
}