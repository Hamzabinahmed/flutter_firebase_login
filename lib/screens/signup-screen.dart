// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_check/components/my_button.dart';
import 'package:firebase_login_check/components/textfields.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController semailControl = TextEditingController();

  TextEditingController spassControl = TextEditingController();

  signup(context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: semailControl.text,
        password: spassControl.text,
      );
      Navigator.pop(context);
      print("User Addes Successfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SignUp"),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: SizedBox(
          height: 300,
          child: Card(
           elevation: 10,
         
          
            margin: const EdgeInsets.only(top: 100),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                
                  MyTextField(
                    controller: semailControl,
                    hintText: "register email",
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
                    controller: spassControl,
                    hintText: "register password",
                    obscureText: false,
                    icon: const Icon(
                      Icons.visibility,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                      onPress: () {
                        signup(context);
                      },
                      text: "Sign up"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
