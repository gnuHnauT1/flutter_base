import 'package:nylo_framework/nylo_framework.dart';

class User extends Model {
  String? userName;
  String? email;
  String? phoneNumber;
  String? avatarPath;


  User(this.userName,this.email,this.phoneNumber,this.avatarPath);

  User.fromJson(dynamic data) {
    userName = data['user_name'];
    email = data['email'];
    phoneNumber = data['phone_number'];
    avatarPath = data['avatar_path'];
  }

  @override
  toJson() => {
        "name": userName,
        "email": email,
        "phone_number": phoneNumber,
        "avatar_path": avatarPath,
      };
}
