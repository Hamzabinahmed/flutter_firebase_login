import 'package:firebase_login_check/screens/slider/pages/page1.dart';
import 'package:firebase_login_check/screens/slider/pages/page2.dart';
import 'package:firebase_login_check/screens/slider/pages/page3.dart';
import 'package:flutter/material.dart';

class CarouselScreen extends StatelessWidget {
  const CarouselScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              Page1(),
              Page2(),
              Page3(),
            ],
          ),
        ],
      ),
    );
  }
}
