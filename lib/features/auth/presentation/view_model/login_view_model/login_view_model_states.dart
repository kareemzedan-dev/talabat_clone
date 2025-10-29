import '../../../domain/entites/login_response_entity/login_response_entity.dart';

abstract class LoginViewModelStates {}
class LoginViewModelInitial extends LoginViewModelStates {}
class LoginViewModelLoading extends LoginViewModelStates {}
class LoginViewModelSuccess extends LoginViewModelStates {
  final LoginResponseEntity loginResponseEntity;
  LoginViewModelSuccess(this.loginResponseEntity);
}
class LoginViewModelError extends LoginViewModelStates {
  final String message;
  LoginViewModelError(this.message);
}
