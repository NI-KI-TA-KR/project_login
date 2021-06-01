import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_login/bloc/title_bloc.dart';
import 'package:sizer/sizer.dart';
import 'button_social_network.dart';
import 'email_button.dart';

class SignUpWidget extends StatelessWidget {
  SignUpWidget({this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        ButtonSocialNetwork(
          urlImage: "assets/icons/facebook.png",
          text: 'Sign up with Facebook',
        ),
        SizedBox(
          height: 30,
        ),
        ButtonSocialNetwork(
          urlImage: "assets/icons/google.png",
          text: 'Sign up with Google',
          color: Colors.green,
        ),
        SizedBox(
          height: 30,
        ),
        ButtonSocialNetwork(
          urlImage: "assets/icons/instagram.png",
          text: 'Sign up with Instagram',
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
              height: 11.h,
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
              height: 11.h,
            )),
          ],
        ),
        EmailButton(),
        SizedBox(
          height: 3.h,
        ),
        Text('Already have an account?',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        InkWell(
          child: Text('Click here',
              style: TextStyle(
                  color: Color.fromRGBO(244, 90, 95, 1), fontSize: 18)),
          onTap: () {
            tabController.index = 1;
            BlocProvider.of<TitleBloc>(context).add(TitleEvent.logIn);
          },
        ),
      ],
    );
  }
}
