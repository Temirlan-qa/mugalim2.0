import 'package:dio/dio.dart';
import 'package:mugalim/core/utils/dio/dio_wrapper.dart';

abstract class ProfileDatasource {
  Future<Response> getProfileData();

  Future<Response> changePassword(String oldPass, String newPass);

  Future<Response> changeAvatar(String path);

  Future<Response> uploadAvatar(String avatar);

}

class ProfileDatasourceImpl implements ProfileDatasource {

  final DioWrapper? dioWrapper;

  ProfileDatasourceImpl({this.dioWrapper}) {
    dioWrapper?.path = '';
  }

  @override
  Future<Response> getProfileData() async {
    Response response = await dioWrapper!.get('/users/current');
    return response;
  }

  @override
  Future<Response> changePassword(String oldPass, String newPass) async {
    Response response = await dioWrapper!.post('/users/change-password',
        data: {
          "oldPassword": oldPass,
          "newPassword": newPass
        }
    );


    return response;
  }

  @override
  Future<Response> changeAvatar(String path) async {
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(path),
    });

    Response response = await dioWrapper!.post(
      '/file/image/upload',
      data: formData,
    );

    return response;
  }

  @override
  Future<Response> uploadAvatar(String avatar) async {
    Response response = await dioWrapper!.put(
        '/users/my-info/update',
        data: {
          "avatar": avatar
        }
    );


    return response;
  }
}