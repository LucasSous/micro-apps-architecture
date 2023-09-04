import 'package:login/domain/entities/user_entity.dart';
import 'package:login/domain/repositories/login_repository.dart';

class LoginRepositoryImp implements LoginRepository {
  @override
  Future<UserEntity> getAuthenticatedUser() async {
    var authenticatedUser = UserEntity(
      userName: 'admin',
      password: '123',
    );
    await Future.delayed(const Duration(seconds: 2));
    return authenticatedUser;
  }
}
