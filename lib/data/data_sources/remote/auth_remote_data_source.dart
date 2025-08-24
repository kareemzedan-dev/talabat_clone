 import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:talabat/core/helper/failures.dart';
import 'package:talabat/data/model/register_response_dm/register_response_dm.dart';
import 'package:talabat/domain/entites/login_response_entity/login_response_entity.dart';
import 'package:talabat/domain/entites/register_response_entity/register_response_entity.dart';

abstract class AuthRemoteDataSource {
  
  Future<Either<Failures, RegisterResponseEntity>> Register(
    String firstName,
    String lastName,
    String email,
    String password,
  ) ; 

  Future<Either<Failures, LoginResponseEntity>> Login(
    String email,
    String password,
  );
 }