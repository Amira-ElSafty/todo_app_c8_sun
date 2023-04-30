import 'package:flutter/material.dart';
import 'package:flutter_todo_app_c8_sun/home/home_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
