import 'package:flutter/material.dart';

import 'Component/base_component.dart';
import 'Component/style/input_size.dart';
import 'Component/widgets/filled_button.dart';
import 'Component/widgets/form.dart';
import 'Component/widgets/icon.dart';
import 'Component/widgets/icon_data.dart';
import 'Component/widgets/text_form_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  bool _isHidePwd = true;
  Map<String, dynamic> isLoginError = {
    'isError': false,
    'message': null,
  };
  final pwdController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FTextFormField(
          obscureText: _isHidePwd,
          validator: (value) {
            if (value.isEmpty) {
              return FTextFieldStatus(status: TFStatus.error, message: 'S.of(context).common_ThieuThongTin');
            } else if (isLoginError['isError']) {
              return FTextFieldStatus(status: TFStatus.error, message: '');
            } else {
              return FTextFieldStatus(status: TFStatus.normal, message: '');
            }
          },
          onChanged: (value) {
            setState(() {
              isLoginError['isError'] = false;
            });
          },
          size: FInputSize.size56,
          labelText:' S.of(context).login_MatKhau',
          controller: pwdController,
          suffixIcon: FFilledButton.icon(
            onPressed: () => null,
            backgroundColor: FColors.transparent,
            child: FIcon(
              size: 16,
              color: FColorSkin.subtitle,
              icon: _isHidePwd ? FFilled.eye_off : FFilled.eye_on,
            ),
          ),
        ),
      ),
    );
  }
}

