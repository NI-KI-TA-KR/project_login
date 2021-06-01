//import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_login/models/user_model.dart';

UserModel user;

class AuthServiceEmail {
  UserModel signInWithEmailAndPassword(String email, String password) {
    // ignore: unrelated_type_equality_checks
    return email == user.email && password.hashCode == user.password
        ? user
        : null;
  }

  UserModel signUpInWithEmailAndPassword(String email, String password) {
    if (!_isCorrectEmail(email) || password.length < 6) return null;
    user = UserModel.fromRepository(email: email, password: password.hashCode);
    return user;
  }

  bool _isCorrectEmail(String email) {
    final regex = RegExp(r'^.*\@.*.*');

    if (regex.hasMatch(email)) return true;
    return false;
  }

  /*final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<UserModel> signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _fAuth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return UserModel.fromFirebase(user);
    } catch(e){
      return null;
    }
  }

    Future<UserModel> registerWithEmailAndPassword(String email, String password) async{
     try{
        UserCredential result = await _fAuth.createUserWithEmailAndPassword(email: email, password: password);
       User user = result.user;
       return UserModel.fromFirebase(user);
     } catch(e){
      return null;
      }
    }

    Future logOut() async{
      await _fAuth.signOut();
    }

    Stream<UserModel> get currentUser{
      return _fAuth.authStateChanges().map((User user) => user != null ? UserModel.fromFirebase(user) : null);
    }
    */
}
