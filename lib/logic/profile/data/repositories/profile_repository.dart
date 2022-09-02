import 'package:dio/dio.dart';
import 'package:mugalim/logic/profile/data/datasources/profile_datasource.dart';
import 'package:mugalim/logic/profile/data/models/profile_model.dart';
import 'package:mugalim/logic/profile/data/models/user_model.dart';

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

}