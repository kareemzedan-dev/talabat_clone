import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/api/api_endpoints.dart';
import '../../../../../../core/api/api_manager.dart';
import '../../../../../../core/helper/failures.dart';
import '../../../../../../core/utils/network_manager.dart';
import '../../../data_sources/remote/login_remote_data_source/login_remote_data_source.dart';
import '../../../model/login_response_dm/login_response_dm.dart';
@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<Either<Failures, LoginResponseDm>> login(
    String email,
    String password,
  ) async {
    try {
      if (!await NetworkManager.hasInternet()) {
        return Left(NetworkFailure('No internet connection'));
      }
      final response = await ApiManager.postData(
        endpoint: ApiEndpoints.login,
        data: {
          'email': email,
          'password': password,
        },
      );
      final jsonData = LoginResponseDm.fromJson(response.data);
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