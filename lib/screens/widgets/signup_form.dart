import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:project_login/models/user_model.dart';
import 'package:project_login/services/auth_repository.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class SignUpForm extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  final AuthRepository _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        Container(
          width: 80.w,
          height: 6.h,
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
              prefix: SizedBox(width: 5.w),
              hintText: 'Email',
              hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.8), fontSize: 2.4.h),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              suffixIcon: Container(
                  margin: EdgeInsets.all(1.w),
                  child: Icon(Entypo.email,
                      color: Colors.grey.withOpacity(0.8), size: 3.h)),
            ),
          ),
        ),
        SizedBox(height: 3.h),
        Container(
          width: 80.w,
          height: 6.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromRGBO(180, 180, 180, 0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextFormField(
            textInputAction: TextInputAction.next,
            style: TextStyle(color: Colors.grey.withOpacity(0.9)),
            controller: passwordController,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              prefix: SizedBox(width: 5.w),
              hintText: 'Password',
              hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.8), fontSize: 2.4.h),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              suffixIcon: Icon(Icons.lock,
                  color: Colors.grey.withOpacity(0.8), size: 3.h),
            ),
          ),
        ),
        SizedBox(height: 3.h),
        Container(
          width: 80.w,
          height: 6.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromRGBO(180, 180, 180, 0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextFormField(
            textInputAction: TextInputAction.done,
            style: TextStyle(color: Colors.grey.withOpacity(0.9)),
            controller: confirmPasswordController,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              prefix: SizedBox(width: 5.w),
              hintText: ' Confirm password',
              hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.8), fontSize: 2.4.h),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              suffixIcon: Icon(Icons.lock,
                  color: Colors.grey.withOpacity(0.8), size: 3.h),
            ),
          ),
        ),
        SizedBox(height: 23.h),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            minimumSize: Size(80.w, 6.h),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          child: Text('Sing up',
              style: TextStyle(
                  color: Color.fromRGBO(249, 27, 190, 1), fontSize: 2.1.h)),
          onPressed: () {
            _registerButtonAction(context);
          },
        ),
      ]),
    );
  }

  void _registerButtonAction(BuildContext context) {
    String email = emailController.text;
    String password1 = passwordController.text;
    String password2 = confirmPasswordController.text;

    if (email.isEmpty || password1.isEmpty || password2.isEmpty) {
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Can't Sing up you! Email or password is empty!",
          ),
          backgroundColor: Colors.red));
      return;
    }

    if (password1 != password2) {
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Can't Sing up you! Passwords not the same!",
          ),
          backgroundColor: Colors.red));
      return;
    }

    UserModel user = _authRepository.singUp(email.trim(), password1.trim());

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Can't Sign up you! Please check your email or password!",
          ),
          backgroundColor: Colors.red));
    } else {
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Success!",
        ),
        backgroundColor: Colors.green,
      ));
      Navigator.pop(context);
    }
  }
}
