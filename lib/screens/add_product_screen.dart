// ignore_for_file: must_be_immutable

import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login_check/components/my_button.dart';
import 'package:firebase_login_check/components/textfields.dart';
import 'package:firebase_login_check/screens/allproduct.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});
  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  addProduct() {
    CollectionReference products =
        FirebaseFirestore.instance.collection("products");
    products
        .add({"Name": productName.text, "Price": productPrice.text});
        
        // .then((value) => print("Product Addes"))
        // .catchError((e) => print(e));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: 250,
            width: double.infinity,
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyTextField(
                      controller: productName,
                      hintText: "Add product",
                      obscureText: false,
                    ),
                    MyTextField(
                      controller: productPrice,
                      hintText: "Add product price",
                      obscureText: false,
                    ),
                    MyButton(
                        onPress: () {
                          addProduct();
                        },
                        text: "Add product"),
                    MyButton(
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllProductsView()));
                        },
                        text: "View Your products"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
