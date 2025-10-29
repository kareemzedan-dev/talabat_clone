import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:talabat/core/helper/failures.dart';
import 'package:talabat/features/auth/domain/use_cases/register_use_case/register_use_case.dart';
import 'package:talabat/features/auth/presentation/view_model/register_view_model/register_view_model_states.dart';

import '../../../domain/entites/register_response_entity/register_response_entity.dart';
@injectable
class RegisterViewModel extends Cubit<RegisterViewModelStates> {
  final RegisterUseCase registerUseCase;

  RegisterViewModel(this.registerUseCase) : super(RegisterViewModelInitial());
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  Future<Either<Failures, RegisterResponseEntity>> register(
    String firstName,
    String lastName,
    String email,
    String password,
    String displayName,
    String phoneNumber,
    String country,
    String city,
    String street,
  ) async {
 try
     {
       emit(RegisterViewModelLoading());
       final result = await registerUseCase.callRegister(
         firstName,
         lastName,
         email,
         password,
         displayName,
         phoneNumber,
         country,
         city,
         street,
       );
       result.fold(
             (failure) => emit(RegisterViewModelError(failure.message)),
             (registerResponseEntity) =>
             emit(RegisterViewModelSuccess(registerResponseEntity)),
       );
       return result;
     }
     catch(e)
     {
       emit(RegisterViewModelError(e.toString()));
       return Left(ServerFailure(e.toString()));
     }
  }
}
