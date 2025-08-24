import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:talabat/core/helper/failures.dart';
import 'package:talabat/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:talabat/domain/entites/login_response_entity/login_response_entity.dart';
import 'package:talabat/domain/entites/register_response_entity/register_response_entity.dart';
import 'package:talabat/domain/repos/auth/auth_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  AuthRemoteDataSource authDataSource;
  AuthRepoImpl(this.authDataSource);
  @override
  Future<Either<Failures, RegisterResponseEntity>> Register(
    String firstName,
    String lastName,
    String email,
    String password,
  ) {
    return authDataSource.Register(firstName, lastName, email, password);
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> Login(
    String email,
    String password,
  ) {
    return authDataSource.Login(email, password);
  }
}
