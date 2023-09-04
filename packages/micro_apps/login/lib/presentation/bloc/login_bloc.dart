import 'package:bloc/bloc.dart';
import 'package:login/domain/usecases/login_usecase.dart';
import 'package:login/presentation/bloc/login_event.dart';
import 'package:login/presentation/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(LoginInitialState()) {
    on<SubmitLoginEvent>((event, emit) async {
      emit(LoginLoadingState());
      var isAuthenticatedUser =
          await _loginUseCase.isAuthenticated(event.userEntity);
      if (isAuthenticatedUser) {
        emit(LoginSuccessState());
      } else {
        emit(LoginErrorState(errorMessage: 'Usuário ou Senha incorreta'));
      }
    });
  }
}
