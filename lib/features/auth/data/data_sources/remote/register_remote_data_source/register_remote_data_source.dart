import 'package:either_dart/either.dart';

import '../../../../../../core/helper/failures.dart';
import '../../../../domain/entites/register_response_entity/register_response_entity.dart';

abstract class RegisterRemoteDataSource {
  Future<Either<Failures, RegisterResponseEntity>> register(
    String firstName,
    String lastName,
    String email,
    String password,
    String displayName,
    String phoneNumber,
    String country,
    String city,
    String street,
  ) ;

}
