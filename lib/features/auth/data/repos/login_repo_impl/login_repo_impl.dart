import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';

import 'package:talabat/core/helper/failures.dart';

import 'package:talabat/features/auth/domain/entites/login_response_entity/login_response_entity.dart';

import '../../../domain/repos/login_repo/login_repo.dart';
import '../../data_sources/remote/login_remote_data_source/login_remote_data_source.dart';
@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo{
  final LoginRemoteDataSource loginRemoteDataSource;
  LoginRepoImpl(this.loginRemoteDataSource);
  @override
  Future<Either<Failures, LoginResponseEntity>> login(String email, String password) {
 return loginRemoteDataSource.login(email, password);
  }
}