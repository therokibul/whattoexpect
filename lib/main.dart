import 'package:flutter/services.dart';
import 'package:whattoexpect/firebase_options.dart';
import 'package:whattoexpect/packages.dart';

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
          // useMaterial3: true,
          scaffoldBackgroundColor: Palette.scaffold,
          primarySwatch: Palette.themeColor,
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Colors.transparent, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Colors.transparent, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Palette.darkColor,
                displayColor: Palette.darkColor,
              ),
          appBarTheme: const AppBarTheme(
              backgroundColor: Palette.scaffold, elevation: 0)),
      home: const Welcome(),
      // home: const Navbar(),
    );
  }
}
