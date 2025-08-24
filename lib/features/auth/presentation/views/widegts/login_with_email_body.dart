import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:talabat/core/di/di.dart';
import 'package:talabat/core/helper/shared_preferences.dart';
import 'package:talabat/core/utils/colors_manger.dart';
import 'package:talabat/core/utils/routes_manager.dart';
import 'package:talabat/core/widgets/custom_button.dart';
import 'package:talabat/core/widgets/custom_text_field.dart';
import 'package:talabat/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:talabat/features/auth/presentation/cubit/auth/auth_states.dart';
import 'package:talabat/features/home/presentation/views/home_view.dart';
class LoginWithEmailBody extends StatefulWidget {
  const LoginWithEmailBody({super.key});

  @override
  State<LoginWithEmailBody> createState() => _LoginWithEmailBodyState();
}

class _LoginWithEmailBodyState extends State<LoginWithEmailBody> {
  final AuthCubit authCubit = getIt<AuthCubit>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   

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
              builder: (_) => Center(
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
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const HomeView()),
              (route) => false,
            );
          }
          if (state is AuthLoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Form(
          key: authCubit.formKey,
          autovalidateMode: authCubit.autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Continue with email',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 32),
              CustomTextFormField(
                autovalidateMode:  authCubit.autovalidateMode!,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                textEditingController: emailController,
                isEmailValidator: true,
                onSaved: (p0) => emailController.text = p0!,
                iconShow: false,
                validator: (p0) {
                  if (p0!.isEmpty) return 'Please enter your email';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              CustomTextFormField(
                autovalidateMode:   authCubit.autovalidateMode!,
                hintText: "Password",
                keyboardType: TextInputType.visiblePassword,
                textEditingController: passwordController,
                isEmailValidator: false,
                onSaved: (p0) => passwordController.text = p0!,
                iconShow: true,
                validator: (p0) {
                  if (p0!.isEmpty) return 'Please enter your password';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Color(0xFFFF6100),
                      fontSize: 14,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesManager.register);
                    },
                    child: const Text(
                      'Create an account',
                      style: TextStyle(
                        color: Color(0xFFFF6100),
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CustomBotton(
                title: "Log in",
                ontap: ()async {
                  if (authCubit.formKey.currentState!.validate()) {
                    context.read<AuthCubit>().LoginUser(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        String? token = SharedPrefHelper.getString('token');
                        print("token $token");
                       
                  } else {
                    setState(() {
                        authCubit.autovalidateMode = AutovalidateMode.onUserInteraction;
                    });
                  }
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
