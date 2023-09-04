import 'package:login/domain/entities/user_entity.dart';
import 'package:login/domain/repositories/login_repository.dart';
import 'package:login/domain/usecases/login_usecase.dart';

class LoginUseCaseImp implements LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCaseImp(this.loginRepository);

  @override
  Future<bool> isAuthenticated(UserEntity userEntity) async {
    var authenticatedUser = await loginRepository.getAuthenticatedUser();
    return userEntity.userName == authenticatedUser.userName &&
        userEntity.password == authenticatedUser.password;
  }
}
