import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:talabat/core/di/di.dart';
import 'package:talabat/core/utils/colors_manger.dart';
import 'package:talabat/core/utils/routes_manager.dart';
import 'package:talabat/core/widgets/custom_button.dart';
import 'package:talabat/core/widgets/custom_text_field.dart';
import 'package:talabat/core/widgets/receive_offers.dart';
import 'package:talabat/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:talabat/features/auth/presentation/cubit/auth/auth_states.dart';
import 'package:talabat/features/auth/presentation/views/widegts/build_privacy_policy.dart';
import 'package:talabat/features/home/presentation/views/home_view.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocListener<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is AuthRegisterLoadingState) {
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
        
            if (state is! AuthRegisterLoadingState) {
              Navigator.pop(context);
            }
            if (state is AuthRegisterSuccessState) {
              Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_)=> HomeView()), (route) => false);
            }
            if (state is AuthRegisterErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create your account",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 32),
                CustomTextFormField(
                  hintText: "First Name",
                  textEditingController: fNameController,
                  validator:
                      (p0) => p0!.isEmpty ? 'This field is required' : null,
                  keyboardType: TextInputType.text,
                  onSaved: (p0) {
                    fNameController.text = p0!;
                  },
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  hintText: "Last Name",
                  textEditingController: lNameController,
                  validator:
                      (p0) => p0!.isEmpty ? 'This field is required' : null,
                  keyboardType: TextInputType.text,
                  onSaved: (p0) {
                    lNameController.text = p0!;
                  },
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  hintText: "Email",
                  textEditingController: emailController,
                  validator:
                      (p0) => p0!.isEmpty ? 'This field is required' : null,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (p0) {
                    emailController.text = p0!;
                  },
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  hintText: "Password",
                  textEditingController: passwordController,
                  iconShow: true,
                  validator:
                      (p0) => p0!.isEmpty ? 'This field is required' : null,
                  keyboardType: TextInputType.visiblePassword,
                  onSaved: (p0) {
                    passwordController.text = p0!;
                  },
                ),
                SizedBox(height: 34),
                ReceiveOffers(),
                SizedBox(height: 48),
                CustomBotton(
                  title: "Create your account",
                  ontap: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthCubit>().registerUser(
                        firstName: fNameController.text,
                        lastName: lNameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
