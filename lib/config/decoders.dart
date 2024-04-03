import 'package:flutter_app/app/controllers/splash_controller.dart';
import 'package:flutter_app/app/networking/auth_api_service.dart';
import 'package:flutter_app/app/networking/user_api_service.dart';

import '/app/controllers/home_controller.dart';
import '/app/networking/api_service.dart';

/*final Map<Type, dynamic> modelDecoders = {
  List<User>: (data) =>
      List.from(data).map((json) => User.fromJson(json)).toList(),
  User: (data) => User.fromJson(data),

  User: (data) => User.fromJson(data),
};*/

// add API Decoders here
final Map<Type, dynamic> apiDecoders = {
  ApiService: () => ApiService(),
  AuthApiService: () => AuthApiService(),
  UserApiService: () => UserApiService(),
};

// Add Controller here
final Map<Type, dynamic> controllers = {
  HomeController: () => HomeController(),
  SplashController: () => SplashController(),

};
