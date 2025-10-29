import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:talabat/core/helper/failures.dart';
import 'package:talabat/features/auth/domain/use_cases/login_use_case/login_use_case.dart';

import '../../../domain/entites/login_response_entity/login_response_entity.dart';
import 'login_view_model_states.dart';
@injectable
class LoginViewModel  extends Cubit<LoginViewModelStates>{
  final LoginUseCase loginUseCase ;
  LoginViewModel(this.loginUseCase) : super(LoginViewModelInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode =AutovalidateMode.disabled;

  Future<Either<Failures,LoginResponseEntity>> login(String email, String password) async {
 try
     {
       emit(LoginViewModelLoading());
       final result = await loginUseCase.callLogin(email, password);
      result.fold(
             (failure) => emit(LoginViewModelError(failure.message)),
             (loginResponseEntity) =>
             emit(LoginViewModelSuccess(loginResponseEntity)),
       );
      return result ;

     }
     catch(e){
       emit(LoginViewModelError(e.toString()));
       return Left(ServerFailure(e.toString()));
     }
  }

}