import 'package:flutter_app/app/models/reset_password_model.dart';
import 'package:flutter_app/app/models/response_data.dart';
import 'package:flutter_app/app/models/user.dart';
import 'package:flutter_app/app/networking/user_api_service.dart';

import 'controller.dart';
import 'package:flutter/widgets.dart';

class UserController extends Controller {
  construct(BuildContext context) {
    super.construct(context);
  }

  Future<User?> getUserInfo() async {
    var res = await UserApiService().getUser();
    return res.data;
  }

  Future<ResponseData<User>> updateUserInfo(
      User dto,
      ) async {
    var response = await UserApiService().updateUser(dto);
    return response;
  }

  Future<ResponseData<String>> forgotPassword(
      String email,
      ) async {
    var response = await UserApiService().forgotPassword(email);
    return response;
  }

  Future<ResponseData<String>> resetPassword(
      ResetPasswordModel dto,
      ) async {
    var response = await UserApiService().resetPassword(dto);
    return response;
  }

 /* goToUserInfo() {
    getUserInfo();
    Navigator.pop(context!);
    Navigator.pop(context!);
    Navigator.pushReplacementNamed(context!, UserPage.path);
  }

  goToLogin() {
    Navigator.pop(context!);
    Navigator.pop(context!);
    Navigator.pushReplacementNamed(context!, LoginPage.path);
  }*/
}
