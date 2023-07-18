import "package:animated_splash_screen/animated_splash_screen.dart";
import "package:firebase_login_check/resources/colors.dart";
import "package:firebase_login_check/screens/login_screen.dart";
import "package:firebase_login_check/screens/slider/carousel_screen.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Column(
          children: [
            Text(
              "The Raptors",
              style:
                  GoogleFonts.aboreto(color: AppColors.depPurple, fontSize: 40),
            ),
            Text(
              "offical brand",
              style: GoogleFonts.aboreto(color: AppColors.depPurple),
            ),
          ],
        ),
      ),
      nextScreen: const LoginScreen(),
    );
    //
  }
}
