import 'package:firebase_login_check/resources/colors.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.name, required this.price});
  final String name;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.depPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      color: Colors.amber,
                      // width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(price,textAlign: TextAlign.center,),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   height: 100,
          //   width: 100,
          // ),
        ],
      ),
    );
  }
}
