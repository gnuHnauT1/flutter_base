import 'package:flutter/material.dart';
import 'package:flutter_app/app/constants/response_status.dart';
import 'package:flutter_app/app/models/response_data.dart';
import 'package:flutter_app/app/models/user.dart';
import 'package:flutter_app/config/storage_keys.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:nylo_framework/nylo_framework.dart';


class ApiService extends NyApiService {
  ApiService({BuildContext? buildContext}) : super(
      buildContext,);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  @override
  // ignore: overridden_fields
  final interceptors = {
    if (getEnv('APP_DEBUG') == true)
    PrettyDioLogger: PrettyDioLogger()
  };

  Future fetchTestData() async {
    return await network(
        request: (request) => request.get("/endpoint-path"),
      handleSuccess: (response) {
        return new ResponseData<User>(
            data: response.data["data"] != null
                ? (response.data["data"])
                .map((e) => User.fromJson(e))
                : null,
            status: response.data["status"],
            errorMessage: response.data["errors"] != null
                ? response.data["errors"].first["message"]
                : null);
      },
      handleFailure: (error) {
        return new ResponseData<User>(
            status: ResponseStatus.ERROR, errorMessage: error.message);
      },
    );
  }

  @override
  Future<RequestHeaders> setAuthHeaders(RequestHeaders headers) async {
    String? myAuthToken = await StorageKey.userToken.read();
    if (myAuthToken != null) {
      headers.addBearerToken( myAuthToken );
    }
    return headers;
  }

  @override
  Future<bool> shouldRefreshToken() async {
    return false;
  }

  @override
  refreshToken(Dio dio) async {
   dynamic response = (await dio.get("https://example.com/refresh-token")).data;
   // Save the new token
    await StorageKey.userToken.store(response['token']);
  }


  displayError(DioException dioException, BuildContext context) {
    showToastNotification(context,
        title: "Error",
        description: dioException.message ?? "",
        style: ToastNotificationStyleType.DANGER);
  }
}