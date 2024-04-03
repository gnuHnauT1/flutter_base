import 'package:flutter/material.dart';
import 'package:flutter_app/app/constants/response_status.dart';
import 'package:flutter_app/app/models/response_data.dart';
import 'package:flutter_app/app/models/user.dart';
import 'package:flutter_app/config/storage_keys.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '/config/decoders.dart';
import 'package:nylo_framework/nylo_framework.dart';


class ApiService extends NyApiService {

  ApiService({BuildContext? buildContext}) : super(
      buildContext,
      decoders: modelDecoders,
      baseOptions: (BaseOptions baseOptions) {
        return baseOptions
                  ..connectTimeout = Duration(seconds: 5)
                  ..sendTimeout = Duration(seconds: 5)
                  ..receiveTimeout = Duration(seconds: 5);
      },
  );

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

  /* Helpers
  |-------------------------------------------------------------------------- */


  /* Authentication Headers
  |--------------------------------------------------------------------------
  | Set your auth headers
  | Authenticate your API requests using a bearer token or any other method
  |-------------------------------------------------------------------------- */

  @override
  Future<RequestHeaders> setAuthHeaders(RequestHeaders headers) async {
    String? myAuthToken = await StorageKey.userToken.read();
    if (myAuthToken != null) {
      headers.addBearerToken( myAuthToken );
    }
    return headers;
  }


  /* Should Refresh Token
  |--------------------------------------------------------------------------
  | Check if your Token should be refreshed
  | Set `false` if your API does not require a token refresh
  |-------------------------------------------------------------------------- */

  @override
  Future<bool> shouldRefreshToken() async {
    return false;
  }


  /* Refresh Token
  |--------------------------------------------------------------------------
  | If `shouldRefreshToken` returns true then this method
  | will be called to refresh your token. Save your new token to
  | local storage and then use the value in `setAuthHeaders`.
  |-------------------------------------------------------------------------- */

  @override
  refreshToken(Dio dio) async {
   dynamic response = (await dio.get("https://example.com/refresh-token")).data;
   // Save the new token
    await StorageKey.userToken.store(response['token']);
  }


  /* Display a error
  |--------------------------------------------------------------------------
  | This method is only called if you provide the API service
  | with a [BuildContext]. Example below:
  | api<ApiService>(
  |        request: (request) => request.myApiCall(),
  |         context: context);
  |-------------------------------------------------------------------------- */

  displayError(DioException dioException, BuildContext context) {
    showToastNotification(context,
        title: "Error",
        description: dioException.message ?? "",
        style: ToastNotificationStyleType.DANGER);
  }
}