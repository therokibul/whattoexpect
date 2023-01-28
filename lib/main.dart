import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:whattoexpect/constants/colors.dart';
import 'package:whattoexpect/firebase_options.dart';
import 'package:whattoexpect/repository/authentication_repository/authentication_repository.dart';
import 'package:whattoexpect/utils/controller_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthController()));

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'What To Expect',

      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.pink,
          // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink),
          useMaterial3: true,
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
            prefixIconColor: secendaryColor,
            floatingLabelStyle: TextStyle(color: secendaryColor),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: secendaryColor),
            ),
          )),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),

      home: const CircularProgressIndicator(),
      // home: const Navbar(),
      initialBinding: ControllerBrindings(),
    );
  }
}
