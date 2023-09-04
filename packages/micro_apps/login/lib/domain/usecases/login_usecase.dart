import 'package:login/domain/entities/user_entity.dart';

abstract class LoginUseCase {
  Future<bool> isAuthenticated(UserEntity userEntity);
}
