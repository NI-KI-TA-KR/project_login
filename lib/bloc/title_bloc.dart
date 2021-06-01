import 'package:flutter_bloc/flutter_bloc.dart';

enum TitleEvent { singUp, logIn }

class TitleState {
  TitleState({this.title});
  final String title;
}

class TitleBloc extends Bloc<TitleEvent, TitleState> {
  TitleBloc() : super(TitleState(title: "Create account"));

  String _getTitle(TitleEvent event) {
    switch (event) {
      case TitleEvent.logIn:
        return "See You There";
      case TitleEvent.singUp:
        return "Create account";
      default:
        return "";
    }
  }

  @override
  Stream<TitleState> mapEventToState(event) async* {
    yield TitleState(title: _getTitle(event));
  }
}
