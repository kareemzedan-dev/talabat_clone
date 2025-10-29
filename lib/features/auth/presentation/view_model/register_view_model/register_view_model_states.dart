import '../../../domain/entites/register_response_entity/register_response_entity.dart';

abstract class RegisterViewModelStates {}
class RegisterViewModelInitial extends RegisterViewModelStates {}
class RegisterViewModelLoading extends RegisterViewModelStates {}
class RegisterViewModelSuccess extends RegisterViewModelStates {
  final RegisterResponseEntity registerResponseEntity;
  RegisterViewModelSuccess(this.registerResponseEntity);
}
class RegisterViewModelError extends RegisterViewModelStates {
  final String message;
  RegisterViewModelError(this.message);
}

