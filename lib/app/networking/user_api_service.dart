import 'package:flutter/material.dart';
import 'package:flutter_app/app/constants/response_status.dart';
import 'package:flutter_app/app/models/reset_password_model.dart';
import 'package:flutter_app/app/models/response_data.dart';
import 'package:flutter_app/app/models/user.dart';
import 'package:nylo_framework/nylo_framework.dart';

class UserApiService extends NyApiService{
  UserApiService({BuildContext? buildContext}) : super(
    buildContext,);
  @override
  String get baseUrl => getEnv('API_BASE_URL');

  Future<ResponseData<User>> getUser() async {
    return await network(
      request: (request) => request.get("/api/user"),
      handleSuccess: (response) {
        return new ResponseData<User>(
            data: response.data["data"] != null
                ? User.fromJson(response.data["data"])
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

  Future<ResponseData<User>> updateUser(User dto) async {
    /*Map<String, dynamic> body = {
      'info': {
        'full_name': dto.userInfo?.fullName ?? "",
        'address': dto.info?.address ?? "",
        'position': dto.info?.position ?? "",
        'unit': dto.info?.unit ?? "",
      },
      'base64_code': dto.base64_code ?? "",
      'email': dto.email ?? "",
      'phone_number': dto.phone_number ?? "",
    };*/
    return await network(
      request: (request) => request.put(
        "/api/user",
        /*data: body,*/
      ),
      handleSuccess: (response) {
        return ResponseData<User>(
          data: response.data["data"] != null
              ? User.fromJson(response.data["data"])
              : null,
          status: response.data["status"],
          errorMessage:
          response.data["errors"] != null && response.data["errors"].isNotEmpty
              ? response.data["errors"].first["message"]
              : null,
        );
      },
      handleFailure: (error) {
        return new ResponseData<User>(
            status: ResponseStatus.ERROR, errorMessage: error.message);
      },
    );
  }

  Future<ResponseData<User>> subscribeNoti(User dto) async {
    /*Map<String, dynamic> body = {
      'info': {
        'full_name': dto.info?.fullName ?? "",
        'address': dto.info?.address ?? "",
        'position': dto.info?.position ?? "",
        'unit': dto.info?.unit ?? "",
        'province_id': dto.info?.provinceId ?? "",
        'district_id': dto.info?.districtId ?? "",
        'commune_id': dto.info?.communeId ?? "",
      },
      'base64_code': dto.base64_code ?? "",
      'email': dto.email ?? "",
      'phone_number': dto.phone_number ?? "",
      'notification': dto.notification ?? "",
    };*/
    return await network(
      request: (request) => request.put(
        "/api/user",
        /*data: body,*/
      ),
      handleSuccess: (response) {
        return ResponseData<User>(
          data: response.data["data"] != null
              ? User.fromJson(response.data["data"])
              : null,
          status: response.data["status"],
          errorMessage:
          response.data["errors"] != null && response.data["errors"].isNotEmpty
              ? response.data["errors"].first["message"]
              : null,
        );
      },
      handleFailure: (error) {
        return new ResponseData<User>(
            status: ResponseStatus.ERROR, errorMessage: error.message);
      },
    );
  }

  Future<ResponseData<String>> forgotPassword(String email) async {
    return await network(
      request: (request) => request.post(
        "/api/user/forgotPassword?email=$email",
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
        return new ResponseData<String>(
            status: ResponseStatus.ERROR, errorMessage: error.message);
      },
    );
  }

  Future<ResponseData<String>> resetPassword(ResetPasswordModel dto) async {
    var formData = FormData();
    formData.fields.add(MapEntry('Email', dto.Email));
    formData.fields.add(MapEntry('Token', dto.Token));
    formData.fields.add(MapEntry('NewPassword', dto.NewPassword));
    formData.fields.add(MapEntry('ConfirmNewpassword', dto.ConfirmNewPassword));
    return await network(
      request: (request) => request.post(
        "/api/user/resetPassword",
        data: formData,
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
        return new ResponseData<String>(
            status: ResponseStatus.ERROR, errorMessage: error.message);
      },
    );
  }
}

