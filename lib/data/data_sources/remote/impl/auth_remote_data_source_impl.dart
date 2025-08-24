import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:either_dart/src/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:talabat/core/helper/failures.dart';
import 'package:talabat/core/helper/shared_preferences.dart';
import 'package:talabat/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:talabat/data/model/login_response_dm/login_response_dm.dart';
import 'package:talabat/data/model/register_response_dm/register_response_dm.dart';

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
          await credential.user!.updateDisplayName("$firstName $lastName");
          await credential.user!.reload();  
      

          final token = await firebaseUser.getIdToken();
          await SharedPrefHelper.setString('token', token!);
          print("Saved Token: $token");
          return Right(response);
        } else {
          return Left(ServerFailure("User registration failed"));
        }
      } else {
        return Left(NetworkFailure('No internet connection'));
      }
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(_mapFirebaseAuthError(e)));
    } catch (e) {
      return Left(ServerFailure("Something went wrong, please try again"));
    }
  }

  @override
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
          final token = await firebaseUser.getIdToken();

          await SharedPrefHelper.setString('token', token!);
          print("Saved Token: $token");
          return Right(response);
        } else {
          return Left(ServerFailure("User login failed"));
        }
      } else {
        return Left(NetworkFailure('No internet connection'));
      }
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(_mapFirebaseAuthError(e)));
    } catch (e) {
      return Left(ServerFailure("Something went wrong, please try again"));
    }
  }

  String _mapFirebaseAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case "invalid-email":
        return "The email address is not valid";
      case "user-disabled":
        return "This account has been disabled";
      case "user-not-found":
        return "No account found with this email";
      case "wrong-password":
        return "The password is incorrect";
      case "email-already-in-use":
        return "This email is already registered";
      case "weak-password":
        return "The password is too weak";
      case "network-request-failed":
        return "Network error, please check your connection";
      default:
        return "Authentication failed, please try again";
    }
  }
}
