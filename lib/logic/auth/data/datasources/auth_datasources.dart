import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../core/routes/environment_config.dart';
import '../../../../core/utils/dio/dio_wrapper.dart';

abstract class TokensRemoteDataSource {
  Future<Response> getTokens(String username, String code);

}

class TokensRemoteDataSourceImpl implements TokensRemoteDataSource {
  final DioWrapper? dioWrapper;

  TokensRemoteDataSourceImpl({this.dioWrapper}) {
    dioWrapper?.path = '';
  }

  @override
  Future<Response> getTokens(String username, String code) async {
    String username1 = 'browser';
    String password = '';

    var basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username1:$password'));

    Response response = await Dio().post(
      '${EnvironmentConfig.url}/uaa/oauth/token',
      // 'https://v3.mugalim.online/uaa/oauth/token',
      data: {
        'username': username,
        'password': code,
        'grant_type': 'password',
      },
      options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {"authorization": basicAuth}),
    );

    print(response);

    return response;
  }
}
