

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_check/components/my_button.dart';
import 'package:firebase_login_check/components/textfields.dart';
import 'package:firebase_login_check/screens/add_product_screen.dart';
import 'package:firebase_login_check/screens/signup-screen.dart';
import 'package:flutter/material.dart';

import '../components/square_tile.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailControl = TextEditingController();

  TextEditingController passControl = TextEditingController();

  login(context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailControl.text, password: passControl.text);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AddProductScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SignIn",style: TextStyle(fontSize: 25),),centerTitle: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              MyTextField(
                controller: emailControl,
                hintText: "enter your email",
                obscureText: false,
                icon: const Icon(
                  Icons.email,
                  size: 20,
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: passControl,
                hintText: "enter your password",
                obscureText: true,
                icon: const Icon(
                  Icons.visibility,
                  size: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              const SizedBox(
                height: 10,
              ),
              // forgot password

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'forgot password ?',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // Sign in button
              MyButton(
                onPress: () {
                  login(context);
                },
                text: "Sign in",
              ),

              const SizedBox(
                height: 50,
              ),
              // or continue with
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey[500],
                      thickness: 0.5,
                    ),
                  ),
                  Text(
                    'Or continue with',
                    style: TextStyle(color: Colors.grey[700], fontSize: 15),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey[500],
                      thickness: 0.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // google + Apple button
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //  google button

                  SquareTile(imagePath: 'lib/images/google.png'),

                  SizedBox(
                    width: 10,
                  ),
                  //  Apple button

                  SquareTile(imagePath: 'lib/images/facebook.png',color: Colors.blue,),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not a memeber?'),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
