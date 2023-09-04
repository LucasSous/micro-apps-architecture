import 'package:get_it/get_it.dart';
import 'package:login/domain/repositories/login_repository.dart';
import 'package:login/domain/repositories/login_repository_imp.dart';
import 'package:login/domain/usecases/login_usecase.dart';
import 'package:login/domain/usecases/login_usecase_imp.dart';
import 'package:login/presentation/bloc/login_bloc.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImp());

    getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCaseImp(getIt()));

    getIt.registerFactory<LoginBloc>(() => LoginBloc(getIt()));
  }
}
