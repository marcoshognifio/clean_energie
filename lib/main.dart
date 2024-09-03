import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:clean_energie/project/create_project.dart';
import 'package:clean_energie/test.dart';
import 'package:clean_energie/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'bilan/bilan.dart';

void main() async{
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
  }
  databaseFactory = databaseFactoryFfi;

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance True App',
      onGenerateRoute:(settings)=>RouteGenerator.generatorRoute(settings),
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome',
    );
  }
}


class RouteGenerator {
  static Route<dynamic> ?generatorRoute(RouteSettings settings) {
    switch (settings.name) {

      case '/welcome':
        return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder:(context, animation, secondAnimation)=>const WelcomePage(),
            transitionsBuilder: (context, animation, secondAnimation,child) {
              var begin=const Offset(0.0, 1.0);
              var end=const Offset(0.0, 0.0);
              var tween=Tween(begin: begin,end:end);
              return SlideTransition(position: animation.drive((tween)),child: child);
            });

      case '/new_project':
        return MaterialPageRoute(builder: (context) => const CreateProject());

      case '/result_project':
        return MaterialPageRoute(builder: (context) => const ResultProject());

    }
    return null;
  }
}
