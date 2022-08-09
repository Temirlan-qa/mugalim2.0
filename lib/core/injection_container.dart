import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:mugalim/core/routes/environment_config.dart';
import 'package:mugalim/core/utils/dio/dio_interceptor.dart';
import 'package:mugalim/core/utils/dio/dio_wrapper.dart';

import '../logic/auth/bloc/auth_bloc.dart';
import '../logic/auth/data/datasources/auth_datasources.dart';
import '../logic/auth/data/repositories/auth_repository.dart';

var sl = GetIt.instance;

void initGetIt() async {
  Box tokensBox = Hive.box('tokens');
  sl.registerFactory<Dio>(
        () => Dio(BaseOptions(baseUrl: EnvironmentConfig.url)),
  );
  sl.registerLazySingleton<DioInterceptor>(
        () => DioInterceptor(tokens: tokensBox, dio: sl()),
  );

  sl.registerFactory<DioWrapper>(
        () => DioWrapper(sl(), sl()),
  );
  sl.registerLazySingleton<TokensRemoteDataSource>(
        () => TokensRemoteDataSourceImpl(dioWrapper: sl()),
  );

  sl.registerLazySingleton<TokensRepository>(
        () => TokensRepositoryImpl(sl()),
  );

  sl.registerFactory<AuthBloc>(
        () => AuthBloc(sl()),
  );
}
