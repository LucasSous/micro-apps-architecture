import 'package:login/domain/entities/user_entity.dart';

abstract class LoginEvent {}

class SubmitLoginEvent extends LoginEvent {
  final UserEntity userEntity;

  SubmitLoginEvent({required this.userEntity});
}
