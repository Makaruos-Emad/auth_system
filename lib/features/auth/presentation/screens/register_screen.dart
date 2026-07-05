import 'package:auth_system/core/constants/app_const.dart';
import 'package:auth_system/features/auth/data/datasource/auth_remote_data_source_impl.dart';
import 'package:auth_system/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:auth_system/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:auth_system/features/auth/presentation/widgets/register_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthCubit(AuthRepositoryImpl(AuthRemoteDataSourceImpl())),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: RegisterScreenBody(),
          ),
        ),
      ),
    );
  }
}
