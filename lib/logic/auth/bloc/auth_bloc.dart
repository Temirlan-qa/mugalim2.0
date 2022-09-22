import 'package:bloc/bloc.dart';

import '../data/models/auth_getTokens_model.dart';
import '../data/repositories/auth_repository.dart';

part 'auth_state.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TokensRepository tokensRepository;

  AuthBloc(this.tokensRepository) : super(AuthInitial()) {
    on<GetTokens>((event, emit) async {
      emit(AuthLoading());
      try {
        final AuthTokensModel tokensModel =
            await tokensRepository.getTokens(event.username, event.code);

        emit(GetTokensSuccess(tokensModel));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
