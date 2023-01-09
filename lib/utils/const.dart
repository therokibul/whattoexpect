import 'package:whattoexpect/packages.dart';

String appTitle = 'What To Expect';

class Palette {
  static const Color scaffold = Color(0xFFF6F8FA);
  // static const Color scaffold = Color(0xFFEDEDED);
  static const Color themeColor1 = Color(0xffFC78A7);
  static const Color gray = Color(0xff8D8E8F);
  static const Color darkColor = Color(0xff24292E);
  static const Color darkColorlig = Color(0xff2f363d);
  static const Color red = Color(0xffff6767);

  static const MaterialColor themeColor = MaterialColor(
    0xffFC78A7,
    <int, Color>{
      50: Color(0xffFC78A7), //10%
      100: Color(0xffFC78A7), //20%
      200: Color(0xffFC78A7), //30%
      300: Color(0xffFC78A7), //40%
      400: Color(0xffFC78A7), //50%
      500: Color(0xffFC78A7), //60%
      600: Color(0xffFC78A7), //70%
      700: Color(0xffFC78A7), //80%
      800: Color(0xffFC78A7), //90%
      900: Color(0xffFC78A7), //100%
    },
  );
}
