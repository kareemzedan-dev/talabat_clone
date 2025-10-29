import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:talabat/core/di/di.dart';
import 'package:talabat/core/utils/colors_manger.dart';
import 'package:talabat/core/widgets/custom_button.dart';
import 'package:talabat/core/widgets/custom_text_field.dart';
import 'package:talabat/core/widgets/receive_offers.dart';
import 'package:talabat/features/auth/presentation/view_model/register_view_model/register_view_model.dart';
import 'package:talabat/features/auth/presentation/view_model/register_view_model/register_view_model_states.dart';
  import 'package:talabat/features/home/presentation/views/home_view.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetController = TextEditingController();


  RegisterViewModel registerViewModel = getIt<RegisterViewModel>();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocListener<RegisterViewModel, RegisterViewModelStates>(
          listener: (context, state) {
            if (state is RegisterViewModelLoading) {
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
        
            if (state is! RegisterViewModelLoading) {
              Navigator.pop(context);
            }
            if (state is RegisterViewModelSuccess) {
              Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_)=> HomeView()), (route) => false);
            }
            if (state is RegisterViewModelError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: Form(
            key: registerViewModel.formKey,
            autovalidateMode:   registerViewModel.autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create your account",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 32),
                CustomTextFormField(
                  autovalidateMode:   registerViewModel.autovalidateMode!,
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
                        autovalidateMode:   registerViewModel.autovalidateMode!,
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
                        autovalidateMode:   registerViewModel.autovalidateMode!,
                  hintText: "Display Name",
                  textEditingController: displayNameController,
                  validator:
                      (p0) => p0!.isEmpty ? 'This field is required' : null,
                  keyboardType: TextInputType.text,
                  onSaved: (p0) {
                    displayNameController.text = p0!;
                  },
                ),  const SizedBox(height: 24),
                CustomTextFormField(
                  autovalidateMode:   registerViewModel.autovalidateMode!,
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
                  autovalidateMode:  registerViewModel.autovalidateMode!,
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
                const SizedBox(height: 24),
                CustomTextFormField(
                        autovalidateMode:   registerViewModel.autovalidateMode!,
                  hintText: "Phone Number",
                  textEditingController: phoneNumberController,
                  validator:
                      (p0) => p0!.isEmpty ? 'This field is required' : null,
                  keyboardType: TextInputType.phone,
                  onSaved: (p0) {
                    phoneNumberController.text = p0!;
                  },
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                        autovalidateMode:   registerViewModel.autovalidateMode!,
                  hintText: "Country",
                  textEditingController: countryController,
                  validator:
                      (p0) => p0!.isEmpty ? 'This field is required' : null,
                  keyboardType: TextInputType.text,
                  onSaved: (p0) {
                    countryController.text = p0!;
                  },
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                        autovalidateMode:   registerViewModel.autovalidateMode!,
                  hintText: "City",
                  textEditingController: cityController,
                  validator:
                      (p0) => p0!.isEmpty ? 'This field is required' : null,
                  keyboardType: TextInputType.text,
                  onSaved: (p0) {
                    cityController.text = p0!;
                  },
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                        autovalidateMode:   registerViewModel.autovalidateMode!,
                  hintText: "Street",
                  textEditingController: streetController,
                  validator:
                      (p0) => p0!.isEmpty ? 'This field is required' : null,
                  keyboardType: TextInputType.text,
                  onSaved: (p0) {
                    streetController.text = p0!;
                  },
                ),

                SizedBox(height: 34),
                ReceiveOffers(),
                SizedBox(height: 48),
                CustomBotton(
                  title: "Create your account",
                  ontap: () {
                    if (registerViewModel.formKey.currentState!.validate()) {
                      context.read<RegisterViewModel>().register(
                        registerViewModel.firstNameController.text,
                        registerViewModel.lastNameController.text,
                        registerViewModel.emailController.text,
                        registerViewModel.passwordController.text,
                        registerViewModel.displayNameController.text,
                        registerViewModel.phoneNumberController.text,
                        registerViewModel.countryController.text,
                        registerViewModel.cityController.text,
                        registerViewModel.streetController.text



                      );
                    }
                    else{
                      registerViewModel.autovalidateMode = AutovalidateMode.onUserInteraction;
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
