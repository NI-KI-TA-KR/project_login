import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_login/bloc/title_bloc.dart';
import 'package:project_login/screens/widgets/login_form.dart';
import 'package:sizer/sizer.dart';
import 'button_social_network.dart';

class LogInWidget extends StatelessWidget {
  LogInWidget({this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          ButtonSocialNetwork(
              urlImage: "assets/icons/facebook.png",
              text: 'Log in with Facebook'),
          SizedBox(
            height: 20,
          ),
          ButtonSocialNetwork(
              urlImage: "assets/icons/google.png",
              text: 'Log in with Google',
              color: Colors.green),
          SizedBox(
            height: 20,
          ),
          ButtonSocialNetwork(
            urlImage: "assets/icons/instagram.png",
            text: 'Log in with Instagram',
            color: Colors.red,
          ),
          Row(
            children: [
              Expanded(
                  child: Divider(
                color: Colors.grey.withOpacity(0.5),
                thickness: 2.5,
                indent: 10.w,
                endIndent: 5.w,
                height: 8.h,
              )),
              Text('Оr',
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.5), fontSize: 18)),
              Expanded(
                  child: Divider(
                color: Colors.grey.withOpacity(0.5),
                thickness: 2.5,
                indent: 5.w,
                endIndent: 10.w,
                height: 8.h,
              )),
            ],
          ),
          LogInForm(),
          SizedBox(height: 1.h),
          RichText(
              text: TextSpan(
                  text: 'Forgot your password? ',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  children: [
                TextSpan(
                  text: 'Click here',
                  style: TextStyle(color: Color.fromRGBO(244, 90, 95, 1)),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => {
                          tabController.index = 0,
                          BlocProvider.of<TitleBloc>(context)
                              .add(TitleEvent.singUp)
                        },
                ),
              ])),
        ],
      ),
    );
  }
}
