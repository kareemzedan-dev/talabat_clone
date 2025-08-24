import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:talabat/core/helper/failures.dart';
import 'package:talabat/domain/entites/login_response_entity/login_response_entity.dart';
import 'package:talabat/domain/entites/register_response_entity/register_response_entity.dart';
import 'package:talabat/domain/repos/auth/auth_repo.dart';
@injectable
class AuthUseCase {

  AuthRepo authRepo ;

  AuthUseCase(this.authRepo) ;

  Future<Either<Failures, RegisterResponseEntity>> callRegister(
      String firstName,
      String lastName,
      String email,
      String password,
      ) => authRepo.Register(firstName, lastName, email, password);


      Future<Either<Failures, LoginResponseEntity>> callLogin(
      String email,
      String password,
      ) => authRepo.Login(email, password);
}