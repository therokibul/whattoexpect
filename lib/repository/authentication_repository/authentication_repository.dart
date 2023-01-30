import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:whattoexpect/constants/text_strings.dart';
import 'package:whattoexpect/features/authentication/screens/welcome_screen.dart';
import 'package:whattoexpect/features/core/screens/home_screen.dart';

import '../../features/authentication/screens/user_info.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;

  late Rx<GoogleSignInAccount?> googleSignInAccount;

  @override
  void onReady() {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance.
    // Since we have to use that many times I just made a constant file and declared there

    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => const WelcomeScreen());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => const Home());
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => const WelcomeScreen());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => const Home());
    }
  }

  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await auth
            .signInWithCredential(credential)
            .catchError((onErr) => print(onErr));
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  void register(String email, password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .whenComplete(() => FirebaseFirestore.instance
                  .collection('users')
                  .doc(uuid)
                  .collection('info')
                  .doc('user')
                  .set({
                'name': 'nameController.text',
                'phone': 'phoneController.text.trim()',
              }))
          .then((value) => Get.to(const UserInfoScreen()));
    } catch (firebaseAuthException) {
      Get.snackbar('Error', firebaseAuthException.toString());
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (firebaseAuthException) {
      Get.snackbar('Error', firebaseAuthException.toString());
    }
  }

  void signOut() async {
    await auth.signOut();
  }
}

// class AuthenticationRepository extends GetxController {
//   static AuthenticationRepository get instance => Get.find();

//   final _auth = FirebaseAuth.instance;
//   late final Rx<User?> firebaseUser;

//   @override
//   void onReady() {
//     Future.delayed(const Duration(seconds: 5));
//     firebaseUser = Rx<User?>(_auth.currentUser);
//     firebaseUser.bindStream(_auth.userChanges());
//     ever(firebaseUser, _setIntialScreen);
//   }

//   _setIntialScreen(User? user) {
//     user == null ? Get.offAll(const WelcomeScreen()) : Get.offAll(const Home());
//   }

//   Future<void> createUserWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       firebaseUser.value != null
//           ? Get.offAll(const WelcomeScreen())
//           : Get.offAll(const Home());
//     } on FirebaseAuthException catch (e) {
//       final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
//       print(ex.massage);
//       throw ex;
//     } catch (_) {
//       final ex = SignUpWithEmailAndPasswordFailure();
//       print(ex.massage);
//       throw ex;
//     }
//   }

//   Future<void> loginUserWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
//       print(ex.massage);
//       throw ex;
//     } catch (_) {
//       final ex = SignUpWithEmailAndPasswordFailure();
//       print(ex.massage);
//       throw ex;
//     }
//   }

//   Future<void> logout() async => await _auth.signOut();
// }
