import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:talabat/domain/use_cases/auth/auth_use_case.dart';
import 'package:talabat/features/auth/presentation/cubit/auth/auth_states.dart';
@injectable
class AuthCubit extends Cubit<AuthStates> {
  AuthCubit({required this.authUseCase}) : super(AuthRegisterInitialState());
  AuthUseCase authUseCase;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  void registerUser({
      String ?firstName,
      String ?lastName,
      String ?email,
      String ?password,
  }) async {
    try {
      emit(AuthRegisterLoadingState());
      final result = await authUseCase.callRegister(
        firstName!,
        lastName!,
        email!,
        password!,
      );
      result.fold(
        (failure) => emit(AuthRegisterErrorState(failure.message)),
        (user) => emit(AuthRegisterSuccessState(user)),
      );
    } catch (e) {
      emit(AuthRegisterErrorState(e.toString()));
    }
  }


  void LoginUser({
    required String email,
    required String password,
  })async{
    try{
      emit(AuthLoginLoadingState());
      final result = await authUseCase.callLogin(
        email,
        password,
      );
      result.fold(
        (failure) => emit(AuthLoginErrorState(failure.message)),
        (user) => emit(AuthLoginSuccessState(user)),
      );

    }
    catch(e){
      emit(AuthLoginErrorState(e.toString()));
    }
  }



}
