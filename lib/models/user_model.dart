//import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  //String id;
  String email;
  int password;

  /* UserModel.fromFirebase(User user){
    id = user.uid;
    email = user.email;
  } 
*/

  UserModel.fromRepository({this.email, this.password});
}
