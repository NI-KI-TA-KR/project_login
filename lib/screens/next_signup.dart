import 'package:flutter/material.dart';
import 'package:project_login/screens/widgets/body_next_signup.dart';
import 'package:sizer/sizer.dart';

class NextSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: BodyNextSignUp(),
    );
  }

  PreferredSize _appbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(35.h),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/city.jpg'),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(height: 12.h),
            Container(
              height: 17.465.h,
              width: 100.w,
              child: Center(
                child: Text(
                  'Time to set up\n your account!',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 7.h),
                ),
              ),
            ),
          ]),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                Color.fromRGBO(247, 18, 241, 1).withOpacity(0.7),
                Color.fromRGBO(255, 102, 3, 1).withOpacity(0.7),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.23),
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
