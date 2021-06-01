import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:project_login/models/user_model.dart';
import 'package:project_login/services/auth_repository.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class LogInForm extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final AuthRepository _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          width: 80.w,
          height: 5.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromRGBO(180, 180, 180, 0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.grey.withOpacity(0.9)),
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.8), fontSize: 2.4.h),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              prefixIcon: Container(
                  margin: EdgeInsets.all(1.w),
                  child: Icon(Entypo.email,
                      color: Colors.grey.withOpacity(0.8), size: 3.h)),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        Container(
          width: 80.w,
          height: 5.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromRGBO(180, 180, 180, 0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextFormField(
            textInputAction: TextInputAction.done,
            style: TextStyle(color: Colors.grey.withOpacity(0.9)),
            controller: passwordController,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.8), fontSize: 2.4.h),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              prefixIcon: Icon(Icons.lock,
                  color: Colors.grey.withOpacity(0.8), size: 3.h),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(240, 136, 39, 1),
            minimumSize: Size(80.w, 6.h),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          child: Text('Log in'),
          onPressed: () {
            _loginButtonAction(context);
          },
        ),
      ]),
    );
  }

  void _loginButtonAction(BuildContext context) {
    /* async */
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      emailController.clear();
      passwordController.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Can't Log in you! Email or password is empty!"),
          backgroundColor: Colors.red));
      return;
    }

    UserModel user = _authRepository.logIn(email.trim(), password.trim());

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text("Can't Log in you! Please check your email or password!"),
          backgroundColor: Colors.red));
      emailController.clear();
      passwordController.clear();
    } else {
      emailController.clear();
      passwordController.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Log in is success! Hello, ${user.email}!"),
          backgroundColor: Colors.green));
    }
  }
}
