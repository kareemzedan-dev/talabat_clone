
import '../../../domain/entites/register_response_entity/register_response_entity.dart';

class RegisterResponseDm extends RegisterResponseEntity {
  RegisterResponseDm({super.user, super.message, super.token});

  RegisterResponseDm.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserDm.fromJson(json['user']) : null;
    message = json['message'];
    token = json['token'];
  }
}

class UserDm extends userRegisterEntity {
  UserDm({super.firstName, super.lastName, super.email, super.password,super.displayName,super.phoneNumber,super.country,super.city,super.street});
  UserDm.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['secondName'];
    email = json['email'];
    password = json['password'];
    displayName = json['displayName'];
    phoneNumber = json['phoneNumber'];
    country = json['country'];
    city = json['city'];
    street = json['street'];
  }
  UserDm.toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['secondName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['displayName'] = displayName;
    data['phoneNumber'] = phoneNumber;
    data['country'] = country;
    data['city'] = city;
    data['street'] = street;
  }
}
