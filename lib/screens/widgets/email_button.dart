import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:project_login/screens/next_signup.dart';
import 'package:sizer/sizer.dart';

class EmailButton extends StatelessWidget {
  const EmailButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      highlightColor: Colors.black.withOpacity(0.9),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NextSignUp()));
      },
      child: Container(
        height: 6.h,
        width: 80.w,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Icon(Entypo.email, color: Colors.white, size: 3.5.h),
          Text(
            'Sing up with Email',
            style: TextStyle(color: Colors.white, fontSize: 2.6.h),
          ),
          SizedBox(width: 5.w),
        ]),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromRGBO(182, 182, 182, 1),
        ),
      ),
    );
  }
}
