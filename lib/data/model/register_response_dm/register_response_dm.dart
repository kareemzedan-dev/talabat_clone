import 'package:talabat/domain/entites/register_response_entity/register_response_entity.dart';

class RegisterResponseDm extends RegisterResponseEntity {
  RegisterResponseDm({super.user, super.message, super.token});

  RegisterResponseDm.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserDm.fromJson(json['user']) : null;
    message = json['message'];
    token = json['token'];
  }
}

class UserDm extends UserEntity {
  UserDm({super.firstName, super.lastName, super.email, super.password});
  UserDm.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
  }
  UserDm.toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
  }
}
