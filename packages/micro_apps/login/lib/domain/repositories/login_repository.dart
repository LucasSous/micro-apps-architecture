import 'package:login/domain/entities/user_entity.dart';

abstract class LoginRepository {
  Future<UserEntity> getAuthenticatedUser();
}
