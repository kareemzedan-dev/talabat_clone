import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';

import 'package:talabat/core/helper/failures.dart';

import 'package:talabat/features/auth/domain/entites/register_response_entity/register_response_entity.dart';

import '../../../domain/repos/register_repo/register_repo.dart';
import '../../data_sources/remote/register_remote_data_source/register_remote_data_source.dart';
@Injectable(as: RegisterRepo)
class RegisterRepoImpl implements RegisterRepo{
  final RegisterRemoteDataSource registerRemoteDataSource;
  RegisterRepoImpl(this.registerRemoteDataSource);
  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String firstName, String lastName, String email, String password, String displayName, String phoneNumber, String country, String city, String street) {
    return registerRemoteDataSource.register(firstName, lastName, email, password, displayName, phoneNumber, country, city, street);
  }

}