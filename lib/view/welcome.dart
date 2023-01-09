import 'package:whattoexpect/packages.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),

                SizedBox(
                  width: double.infinity,
                  height: Get.height * 0.5,
                  child: Lottie.asset('assets/animation/pregnant_women.json'),
                ),

                // SizedBox(
                //   height: Get.height * 0.15,
                // ),

                Text(
                  appTitle,
                  textScaleFactor: 2,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: Get.width * 0.7,
                  child: const Text(
                    'Track your Pregnancy, take care your health, your baby, stay safe and count your days until birth.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.1,
                ),
                Button(
                    text: 'LET\'S GET STARTED',
                    color: Colors.white,
                    onTap: () {
                      Get.off(const SignIn());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
