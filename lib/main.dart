// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pods_only/ui/screens/home.dart';
import 'package:pods_only/utils/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //     String? name = stdin.readLineSync();
    // print(name);
    return  MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Home(),
      onGenerateRoute: RouteHelper().generateRoute,
   
    );
  }
}

