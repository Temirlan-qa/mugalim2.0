import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:mugalim/logic/profile/data/models/profile_model.dart';
import 'package:mugalim/logic/profile/data/repositories/profile_repository.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;
  final Box tokensBox = Hive.box('tokens');

  ProfileBloc(this.profileRepository) : super(ProfileInitial()) {
    on<ProfileLoad>((event, emit) async {
      emit(ProfileLoading());
      try {
        ProfileModel profileModel = await profileRepository.getProfileData();
        tokensBox.put('profileId', profileModel.id);

        emit(ProfileSuccess(profileModel));
      } catch (e) {
        emit(ProfileFailure(e.toString()));
      }
    });
    on<ProfileInfoEdit>((event, emit) async {
      emit(ProfileInfoEditing());
      try {
        ProfileModel profileModel = await profileRepository.getProfileData();
        tokensBox.put('profileId', profileModel.id);

        emit(ProfileInfoEditSuccess(profileModel));
      } catch (e) {
        emit(ProfileInfoEditFailure(e.toString()));
      }
    });
  }
}
