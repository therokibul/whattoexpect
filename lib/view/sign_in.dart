import 'package:whattoexpect/packages.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool password = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                        const Text(
                          'Track your pregnancy',
                          textScaleFactor: 2.5,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: Get.width * 0.7,
                          child: const Text(
                            'You can track your weight, baby kick count, constaction, ovilation',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: Get.height * 0.5,
                          child: Lottie.asset(
                              'assets/animation/baby_waiting.json'),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              await AuthService().signWithGoogle();
                              FirebaseAuth.instance
                                  .authStateChanges()
                                  .listen((User? user) {
                                if (user != null) {
                                  Get.to(const Home());
                                }
                              });

                              setState(() {
                                setState(() {
                                  isLoading = false;
                                });
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/google_icon.png',
                                  height: 30,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text(
                                  'Continue with Google',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
