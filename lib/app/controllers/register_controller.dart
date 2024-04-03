import 'package:flutter_app/app/models/register_model.dart';
import 'package:flutter_app/app/models/response_data.dart';
import 'package:flutter_app/app/networking/auth_api_service.dart';

import 'controller.dart';
import 'package:flutter/widgets.dart';

class RegisterController extends Controller {
  late AuthApiService authApiService;

  construct(BuildContext context) {
    authApiService = new AuthApiService(buildContext: context);
    super.construct(context);
  }

  Future<ResponseData<String>> register(RegisterModel dto) async {
    var response = await authApiService.register(dto);
    return response;
  }

/*goToLogin() {
    Navigator.pushReplacementNamed(context!,LoginPage.path.getRouteName());
  }*/
}
