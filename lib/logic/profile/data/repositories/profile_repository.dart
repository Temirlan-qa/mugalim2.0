import 'package:dio/dio.dart';
import 'package:mugalim/logic/profile/data/datasources/profile_datasource.dart';
import 'package:mugalim/logic/profile/data/models/profile_model.dart';

abstract class ProfileRepository {
  Future<ProfileModel> getProfileData();

}

class ProfileRepositoryImpl extends ProfileRepository {

  final ProfileDatasource profileDatasource;

  ProfileRepositoryImpl(this.profileDatasource);

  @override
  Future<ProfileModel> getProfileData() async {
    Response response = await profileDatasource.getProfileData();
    // Response response2 = await profileDatasource.getNotificationList();
    // print(response2);
    return ProfileModel.fromJson(response.data);
  }

  @override
  Future<ProfileModel> changePassword(oldPass,newPass) async {
    Response response = await profileDatasource.changePassword(oldPass, newPass);
    // Response response2 = await profileDatasource.getNotificationList();
    // print(response2);
    return ProfileModel.fromJson(response.data);
  }

  @override
  Future<ProfileModel> changeAvatar(path) async {
    Response response = await profileDatasource.changeAvatar(path);
    // Response response2 = await profileDatasource.getNotificationList();
    // print(response2);
    return ProfileModel.fromJson(response.data);
  }


  @override
  Future<ProfileModel> uploadAvatar(avatar) async {
    Response response = await profileDatasource.uploadAvatar(avatar);
    // Response response2 = await profileDatasource.getNotificationList();
    // print(response2);
    return ProfileModel.fromJson(response.data);
  }
}