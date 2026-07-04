import 'package:flutter/material.dart';
import 'package:islami_c19/core/resources/routes_manager.dart';
import 'package:islami_c19/ui/home/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes:{
        RoutesManager.homeRouteName:(_)=>HomeScreen()
      } ,
      initialRoute: RoutesManager.homeRouteName,
    );
  }
}
