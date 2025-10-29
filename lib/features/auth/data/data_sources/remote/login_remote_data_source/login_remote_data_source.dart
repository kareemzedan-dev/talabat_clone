import 'package:either_dart/either.dart';

import '../../../../../../core/helper/failures.dart';
import '../../../../domain/entites/login_response_entity/login_response_entity.dart';

abstract class LoginRemoteDataSource {
  Future<Either<Failures, LoginResponseEntity>> login(
    String email,
    String password,
  );
}