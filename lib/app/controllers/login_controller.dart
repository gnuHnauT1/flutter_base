import 'package:flutter_app/app/controllers/controller.dart';
import 'package:flutter_app/app/models/login_model.dart';
import 'package:flutter_app/app/models/response_data.dart';
import 'package:flutter_app/app/networking/auth_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/resources/pages/home_page.dart';

class LoginController extends Controller{
  late AuthApiService authApiService;
  construct(BuildContext context) async {
    authApiService = new AuthApiService(buildContext: context);
    super.construct(context);
  }

  Future<ResponseData<String>> login(LoginModel dto) async {
    var response = await authApiService.login(dto);
    return response;
  }

  goToMain() {
    Navigator.pushNamedAndRemoveUntil(context!, HomePage.path,(Route<dynamic> route) => false);
  }
}