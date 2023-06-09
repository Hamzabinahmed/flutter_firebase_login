// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login_check/firebase_options.dart';
import 'package:firebase_login_check/screens/allproduct.dart';
import 'package:firebase_login_check/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black,),),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      // home: AllProductsView(),
    );
  }
}
