import 'package:flutter/material.dart';
import 'package:project_login/bloc/title_bloc.dart';
import 'package:project_login/screens/login_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Project account',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: BlocProvider<TitleBloc>(
          create: (context) => TitleBloc(),
          child: LoginScreen(),
        ),
      );
    });
  }
}
