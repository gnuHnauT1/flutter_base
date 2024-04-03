import 'package:flutter/material.dart';
import 'package:flutter_app/app/constants/response_status.dart';
import 'package:flutter_app/app/models/login_model.dart';
import 'package:flutter_app/app/models/register_model.dart';
import 'package:flutter_app/app/models/response_data.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AuthApiService extends NyApiService{
  AuthApiService({BuildContext? buildContext}) : super(
    buildContext,);
  @override
  String get baseUrl => getEnv('API_BASE_URL');

  /// Example API Request
  Future<ResponseData<String>> login(LoginModel dto) async {
    return await network(
      request: (request) => request.post(
        "api/Authenticate/login",
        data: dto.toJson(),
      ),
      handleSuccess: (response) {
        return new ResponseData<String>(
            data: response.data["data"] != null
                ? response.data["data"]["access_token"]
                : null,
            status: response.data["status"],
            errorMessage: response.data["errors"] != null
                ? response.data["errors"].first["message"]
                : null);
      },
      handleFailure: (error) {
        return new ResponseData(
            status: ResponseStatus.ERROR, errorMessage: error.message);
      },
    );
  }

  Future<ResponseData<String>> register(RegisterModel dto) async {
    Map<String, dynamic> body = {
      "Username": dto.Username,
      "Email": dto.Email,
      'Password': dto.Password,
      'PhoneNumber': dto.PhoneNumber,
      'Address': dto.Address,
      'Unit': dto.Unit,
      'FullName': dto.FullName,
    };
    return await network(
      request: (request) => request.post(
        "/api/Authenticate/register",
        data: body,
      ),
      handleSuccess: (response) {
        return new ResponseData<String>(
            data: response.data["data"] != null
                ? response.data["data"]["access_token"]
                : null,
            status: response.data["status"],
            errorMessage: response.data["errors"] != null
                ? response.data["errors"].first["message"]
                : null);
      },
      handleFailure: (error) {
        return new ResponseData(
            status: ResponseStatus.ERROR, errorMessage: error.message);
      },
    );
  }
}