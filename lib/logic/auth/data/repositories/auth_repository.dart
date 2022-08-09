import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../datasources/auth_datasources.dart';
import '../models/auth_getTokens_model.dart';

abstract class TokensRepository {
  Future<AuthTokensModel> getTokens(String username, String code);
}

class TokensRepositoryImpl implements TokensRepository {
  final TokensRemoteDataSource tokensRemoteDataSource;

  TokensRepositoryImpl(this.tokensRemoteDataSource);

  @override
  Future<AuthTokensModel> getTokens(String username, String code) async {
    Response response = await tokensRemoteDataSource.getTokens(username, code);

    Hive.box('tokens').put('access', response.data['access_token']);
    Hive.box('tokens').put('refresh', response.data['refresh_token']);

    return AuthTokensModel.fromJson(response.data);
  }
}
