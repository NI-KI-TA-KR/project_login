import 'package:project_login/services/auth_email.dart';

class AuthRepository {
  final AuthServiceEmail _authServiceEmail = AuthServiceEmail();

/*
  logIn(String email, String password) => _authServiceEmail.signInWithEmailAndPassword(email, password);

  singUp(String email, String password) => _authServiceEmail.registerWithEmailAndPassword(email, password);

  logOut() =>  _authServiceEmail.logOut();

   get currentUser{
     return _authServiceEmail.currentUser;
   } 
  */
  logIn(String email, String password) =>
      _authServiceEmail.signInWithEmailAndPassword(email, password);

  singUp(String email, String password) =>
      _authServiceEmail.signUpInWithEmailAndPassword(email, password);
}
