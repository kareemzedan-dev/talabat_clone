import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:either_dart/src/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:talabat/core/helper/failures.dart';
import 'package:talabat/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:talabat/data/model/login_response_dm/login_response_dm.dart';
import 'package:talabat/data/model/register_response_dm/register_response_dm.dart';
import 'package:talabat/domain/entites/register_response_entity/register_response_entity.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<Either<Failures, RegisterResponseDm>> Register(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    try {
      List<ConnectivityResult> result =
          await Connectivity().checkConnectivity();
      if (result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.mobile)) {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        final firebaseUser = credential.user;

        if (firebaseUser != null) {
          final userDm = UserDm(
            firstName: firstName,
            lastName: lastName,
            email: firebaseUser.email,
            password: password,
          );

          final response = RegisterResponseDm(
            user: userDm,
            message: "User registered successfully",
            token: await firebaseUser.getIdToken(),
          );

          return Right(response);
        } else {
          return Left(ServerFailure("User registration failed"));
        }
      } else {
        return Left(NetworkFailure('No internet connection'));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failures, LoginResponseDm>> Login(
    String emailAddress,
    String password,
  ) async {
    try {
      List<ConnectivityResult> result =
          await Connectivity().checkConnectivity();
      if (result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.mobile)) {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: emailAddress,
              password: password,
            );

        final firebaseUser = credential.user;

        if (firebaseUser != null) {
          final userDm = LoginUserDm(email: emailAddress, password: password);
          final response = LoginResponseDm(
            user: userDm,
            message: "User logged in successfully",
            token: await firebaseUser.getIdToken(),
          );
          return Right(response);
        } else {
          return Left(ServerFailure("User login failed"));
        }
      } else {
        return Left(NetworkFailure('No internet connection'));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
