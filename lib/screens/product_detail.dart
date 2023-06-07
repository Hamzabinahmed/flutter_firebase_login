import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
   const ProductDetail({super.key,required this.name,required this.price});
 final String name;
 final String price;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(height: 100,width: 100,),
          Text(name),
          Text(price),
        ],
      ),
    );
  }
}