class RegisterResponseEntity {
  String? token;
  UserEntity? user;
  String? message;
  RegisterResponseEntity({this.token, this.user, this.message});
}

class UserEntity {
  String? firstName;
  String? lastName;

  String? email;
  String? password;
  UserEntity({this.firstName, this.lastName, this.email, this.password});
}
