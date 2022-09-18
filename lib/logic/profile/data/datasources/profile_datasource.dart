import 'package:dio/dio.dart';
import 'package:mugalim/core/utils/dio/dio_wrapper.dart';

abstract class ProfileDatasource {
  Future<Response> getProfileData();

  Future<Response> changePassword(String oldPass, String newPass);
  Future<Response> editUserInfo(String email, String phone, String avatar);
  Future<Response> uploadAvatar(String avatar);
  Future<Response> changeAvatar(String path);
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
        data: {"oldPassword": oldPass, "newPassword": newPass});
    return response;
  }

  @override
  Future<Response> editUserInfo(String email, String phone, String avatar) async {
    Response response = await dioWrapper!.put('/users/my-info/update', data: {
      "email": email,
      "phone": phone,
      "avatar": avatar,
    });
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
    Response response = await dioWrapper!
        .put('/users/my-info/update', data: {"avatar": avatar});
    return response;
  }
}
