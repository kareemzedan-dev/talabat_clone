import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabat/core/di/di.dart';
import 'package:talabat/features/auth/presentation/view_model/login_view_model/login_view_model.dart';
import 'package:talabat/features/auth/presentation/views/widegts/login_with_email_body.dart';

class LoginWithEmail extends StatelessWidget {
  const LoginWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) =>  getIt<LoginViewModel>(),
        child: LoginWithEmailBody(),
      ),
    );
  }
}
