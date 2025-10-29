import 'package:either_dart/either.dart';

import '../../../../../core/helper/failures.dart';
import '../../entites/login_response_entity/login_response_entity.dart';

abstract class LoginRepo {
  Future<Either<Failures, LoginResponseEntity>> login(String email, String password);
}