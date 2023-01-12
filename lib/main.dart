import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:whattoexpect/constants/colors.dart';
import 'package:whattoexpect/features/authentication/screens/welcome_screen.dart';
import 'package:whattoexpect/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      transitionDuration: const Duration(microseconds: 5000),

      home: const WelcomeScreen(),
      // home: const Navbar(),
    );
  }
}
