class RegisterResponseEntity {
  String? token;
  userRegisterEntity? user;
  String? message;
  RegisterResponseEntity({this.token, this.user, this.message});
}

class userRegisterEntity {
  String ? displayName ;
  String? firstName;
  String? lastName;

  String? email;
  String? password;
  String?phoneNumber ;
  String?country ;
  String?city ;
  String?street ;


  userRegisterEntity({this.firstName, this.lastName, this.email, this.displayName ,this.password,this.phoneNumber,this.country,this.city,this.street});
}
