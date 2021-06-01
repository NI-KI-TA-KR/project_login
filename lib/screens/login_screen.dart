import 'package:flutter/material.dart';
import 'package:project_login/screens/widgets/login_widget.dart';
import 'package:project_login/screens/widgets/signup_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_login/bloc/title_bloc.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  List<Widget> _kTabPages;

  final _kTabNames = <Tab>[
    const Tab(text: 'Sign up'),
    const Tab(text: 'Log in'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _kTabNames.length);
    _kTabPages = <Widget>[
      SignUpWidget(tabController: _tabController),
      LogInWidget(tabController: _tabController),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TitleBloc _titleBloc = BlocProvider.of<TitleBloc>(context);

    return DefaultTabController(
      length: _kTabNames.length,
      child: Scaffold(
        appBar: _appBar(_titleBloc),
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: _kTabPages,
        ),
      ),
    );
  }

  PreferredSize _appBar(TitleBloc bloc) {
    return PreferredSize(
      preferredSize: Size.fromHeight(35.h),
      child: Container(
        child: Column(children: [
          SizedBox(height: 15.h),
          BlocBuilder<TitleBloc, TitleState>(
            builder: (context, state) => Container(
              height: 17.465.h,
              child: Text(
                state.title,
                style: TextStyle(color: Colors.white, fontSize: 5.h),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              onTap: (index) {
                switch (index) {
                  case 0:
                    bloc.add(TitleEvent.singUp);
                    break;
                  case 1:
                    bloc.add(TitleEvent.logIn);
                    break;
                }
              },
              tabs: _kTabNames,
              labelStyle: TextStyle(fontSize: 2.2.h),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 5, color: Colors.white),
              ),
            ),
          ),
        ]),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: <Color>[
              Color.fromRGBO(247, 18, 241, 1),
              Color.fromRGBO(255, 102, 3, 1),
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
    );
  }
}
