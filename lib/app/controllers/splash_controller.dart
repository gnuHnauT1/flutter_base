import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/controller.dart';
import 'package:flutter_app/resources/pages/home_page.dart';

class SplashController extends Controller{

  goToLogin() {
    //Navigator.pushReplacementNamed(context!, LoginPage.path);
  }

  goToNoLogin() {
    Navigator.pushReplacementNamed(context!,HomePage.path);
  }

  goToMain() {
    Navigator.pushReplacementNamed(context!, HomePage.path);
  }
}