import 'package:firebase_auth/firebase_auth.dart';

import 'database_service.dart';

class AuthService {
  final FirebaseAuth firebaseauth = FirebaseAuth.instance;

  //Login

  //Register
  Future registerUserwithEmailandPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseauth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        //call our database
        await DatabaseService(uid: user.uid).updateUserData(fullName, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e;
    }
  }

  //Sign out
}
