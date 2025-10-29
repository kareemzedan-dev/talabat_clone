
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/helper/failures.dart';
import '../../entites/login_response_entity/login_response_entity.dart';
import '../../repos/login_repo/login_repo.dart';
@injectable
class LoginUseCase {

  LoginUseCase(this.loginRepo);

  final LoginRepo loginRepo;

  Future<Either<Failures, LoginResponseEntity>> callLogin(String email, String password) => loginRepo.login(email, password);
}