class LoginModel {
  String username;
  String password;

  LoginModel(this.username, this.password);

  Map<String, dynamic> toJson() {
    return {"username": username, "password": password};
  }
}