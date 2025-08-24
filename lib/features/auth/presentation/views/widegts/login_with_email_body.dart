import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:talabat/core/di/di.dart';
import 'package:talabat/core/utils/colors_manger.dart';
import 'package:talabat/core/utils/routes_manager.dart';
import 'package:talabat/core/widgets/custom_button.dart';
import 'package:talabat/core/widgets/custom_text_field.dart';
import 'package:talabat/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:talabat/features/auth/presentation/cubit/auth/auth_states.dart';
import 'package:talabat/features/home/presentation/views/home_view.dart';

class LoginWithEmailBody extends StatelessWidget {
  LoginWithEmailBody({super.key});
  AuthCubit authCubit = getIt<AuthCubit>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is AuthLoginLoadingState) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder:
                  (_) => Center(
                    child: LoadingAnimationWidget.threeRotatingDots(
                      size: 60,
                      color: ColorsManager.primary,
                    ),
                  ),
            );
          }
          if (state is! AuthLoginLoadingState) {
            Navigator.pop(context);
          }
          if (state is AuthLoginSuccessState) {
          Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_)=> HomeView()), (route) => false);
          }
          if (state is AuthLoginErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
       
        },
        child: Form(
          key:  authCubit.formKey,
          autovalidateMode:AutovalidateMode.onUserInteraction ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Continue with email',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 32),
              CustomTextFormField(
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                textEditingController: emailController,
               
                isEmailValidator: true,
                onSaved: (p0) {
                  emailController.text = p0!;
                },
                iconShow: false,
              ),
              SizedBox(height: 24),
              CustomTextFormField(
                hintText: "Password",
                keyboardType: TextInputType.visiblePassword,
                textEditingController: passwordController,
                validator: (p0) {},
                isEmailValidator: false,
                onSaved: (p0) {
                passwordController.text = p0!;
                },
                iconShow: true,
              ),
                
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: const Color(0xFFFF6100),
                      fontSize: 14,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesManager.register);
                    },
                    child: Text(
                      'Create an account',
                      style: TextStyle(
                        color: const Color(0xFFFF6100),
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
                
              Spacer(),
                
              CustomBotton(title: "Log in", ontap: () {
        if (authCubit.formKey.currentState!.validate()) {
              context.read<AuthCubit>().LoginUser(
                  email: emailController.text,
                  password: passwordController.text,
                );
        }
              }),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
