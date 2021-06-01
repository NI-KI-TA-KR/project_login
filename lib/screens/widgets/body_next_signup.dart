import 'package:flutter/material.dart';
import 'package:project_login/screens/widgets/signup_form.dart';
import 'package:sizer/sizer.dart';

class BodyNextSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(children: []),
          SignUpForm(),
          SizedBox(height: 1.h),
        ],
      ),
    );
  }
}
