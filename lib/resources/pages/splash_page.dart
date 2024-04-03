import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/splash_controller.dart';
import 'package:flutter_app/config/storage_keys.dart';
import 'package:flutter_app/resources/widgets/logo_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class SplashPage extends NyStatefulWidget<SplashController> {
  static const path = '/';

  SplashPage({super.key}) : super(path, child: _SplashPageState());
}

class _SplashPageState extends NyState<SplashPage> {
  @override
  boot() async {
    Future.delayed(Duration(milliseconds: 500)).then((value) async {
      String? token = await NyStorage.read(StorageKey.userToken);
      if (token == null || token == "") {
        //widget.controller.goToLogin();
        widget.controller.goToNoLogin();
      } else {
        widget.controller.goToMain();
      }
    });
    return super.boot();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Logo(),
        ),
      ),
    );
  }
}
