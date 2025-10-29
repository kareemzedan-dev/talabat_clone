import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import 'package:injectable/injectable.dart';
import 'package:talabat/core/api/api_endpoints.dart';
import 'package:talabat/core/helper/failures.dart';
import 'package:talabat/core/utils/network_manager.dart';
import 'package:talabat/features/auth/data/data_sources/remote/register_remote_data_source/register_remote_data_source.dart';
import 'package:talabat/features/auth/data/model/register_response_dm/register_response_dm.dart';

import '../../../../../../core/api/api_manager.dart';

@Injectable(as: RegisterRemoteDataSource)
class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  @override
  Future<Either<Failures, RegisterResponseDm>> register(
    String firstName,
    String lastName,
    String email,
    String password,
    String displayName,
    String phoneNumber,
    String country,
    String city,
    String street,
  ) async {
    try {
      if (!await NetworkManager.hasInternet()) {
        return Left(NetworkFailure('No internet connection'));
      }
      final response = await ApiManager.postData(
        endpoint: ApiEndpoints.register,
        data: {
          'firstName': firstName,
          'secondName': lastName,
          'email': email,
          'password': password,
          'displayName': displayName,
          'phoneNumber': phoneNumber,
          'country': country,
          'city': city,
          'street': street,
        },
      );
      final jsonData = RegisterResponseDm.fromJson(response.data);
      return Right(jsonData);
    } catch (e) {
      if (e is DioException) {
        final message = e.response?.data?['message'] ?? e.message;
        return Left(ServerFailure(message ?? 'Server error'));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
