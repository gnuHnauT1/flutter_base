import 'package:flutter_app/resources/pages/splash_page.dart';
import '/resources/pages/home_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| App Router
| * [Tip] Create pages faster 🚀
| Run the below in the terminal to create new a page.
| "flutter pub run nylo_framework:main make:page profile_page"
| Learn more https://nylo.dev/docs/5.20.0/router
|--------------------------------------------------------------------------
*/

appRouter() => nyRoutes((router) {
      router.route(SplashPage.path, (context) => SplashPage());
      // Add your routes here

      // router.route(NewPage.path, (context) => NewPage(), transition: PageTransitionType.fade);
      router.route(HomePage.path, (context) => HomePage());
    });
