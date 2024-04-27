import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/Home/presentation/pages/movieDetails.dart';
import 'package:movies/features/MainScreen/presentation/pages/mainScreen.dart';

class AppRoutesName{
  static const String mainScreen="/";
  static const String details="details";
}
class AppRouter{
  static Route onGenerate(RouteSettings settings){
    switch(settings.name){
      case AppRoutesName.mainScreen:
        return MaterialPageRoute(builder: (context) => MainScreen(),);
      case AppRoutesName.details:
        return MaterialPageRoute(builder: (context) => MovieDetails(),);
      default:
        return MaterialPageRoute(builder: (context) => unDefinedRoute(),);
    }
  }
}
Widget unDefinedRoute(){
  return Scaffold(
    body: Text("Un Defined Route Name"),
  );
}