
import 'package:chat_app_new/helper/helper_function.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'database_service.dart';

class AuthService {
  final FirebaseAuth firebaseauth = FirebaseAuth.instance;

  //Login

  Future loginWithUserNameandPassword(
       String email, String password) async {
    try {
      User user = (await firebaseauth.signInWithEmailAndPassword(
          email: email, password: password))
          .user!;
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e;
    }
  }

  //Register
  Future registerUserwithEmailandPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseauth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        //call our database
        await DatabaseService(uid: user.uid).savingUserData(fullName, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e;
    }
  }

  //Sign out
Future signOut()async{
    try{
  await HelperFunctions.saveUserLoggedInStatus(false);
  await HelperFunctions.saveUserName("");
  await HelperFunctions.saveUserEmail("");
  await firebaseauth.signOut();


    }catch(e){
      return null;
    }
}

}
