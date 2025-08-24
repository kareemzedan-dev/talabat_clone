import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabat/core/di/di.dart';
import 'package:talabat/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:talabat/features/auth/presentation/views/widegts/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Welcome to talabat',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: BlocProvider(
     create: (context) => getIt<AuthCubit>(),
        child: RegisterViewBody(),
      ),
    );
  }
}
