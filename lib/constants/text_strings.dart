import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:whattoexpect/repository/authentication_repository/authentication_repository.dart';

const String appTitle = 'What To Expect';

AuthController authController = AuthController.instance;
final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
GoogleSignIn googleSign = GoogleSignIn();
final uuid = auth.currentUser!.uid;

var now = DateTime.now();
var formatter = DateFormat('dd-MM-yyyy');
String formattedTime = DateFormat('kk:mm:a').format(now);
String formattedDate = formatter.format(now);

