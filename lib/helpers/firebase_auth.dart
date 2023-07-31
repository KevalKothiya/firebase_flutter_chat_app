import 'package:firebase_auth/firebase_auth.dart';


class FBAHelper{
  FBAHelper._();

  static final FBAHelper fbaHelper = FBAHelper._();

  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<Map<String, dynamic>> anonymous() async {
    Map<String, dynamic> data = {};
    try {
      UserCredential userCredential = await firebaseAuth.signInAnonymously();

      User? user = userCredential.user;
      data['user'] = user;

      return data;

    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'admin-restricted-operation':
          data['msg'] = "This operations is restricted to administrators only.";
        case 'operations-not-allowed':
          data['msg'] = "Operations not allowed.";
      }
      return data;
    }
  }
}