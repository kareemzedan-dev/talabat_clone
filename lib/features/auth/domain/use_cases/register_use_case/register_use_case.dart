import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/helper/failures.dart';
import '../../entites/register_response_entity/register_response_entity.dart';
import '../../repos/register_repo/register_repo.dart';
@injectable
class RegisterUseCase {
  RegisterUseCase(this.registerRepo);

  final RegisterRepo registerRepo;

  Future<Either<Failures, RegisterResponseEntity>> callRegister(
      String firstName,
      String lastName,
      String email,
      String password,
      String displayName,
      String phoneNumber,
      String country,
      String city,
      String street,
      ) => registerRepo.register(firstName, lastName, email, password, displayName, phoneNumber, country, city, street);
}