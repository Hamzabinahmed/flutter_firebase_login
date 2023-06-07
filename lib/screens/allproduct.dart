import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login_check/screens/product_detail.dart';
import 'package:flutter/material.dart';

class AllProductsView extends StatelessWidget {
  AllProductsView({
    super.key,
  });

  final CollectionReference products =
      FirebaseFirestore.instance.collection("products");

  getAllProducts() async {
    return products.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
          future: getAllProducts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: snapshot.data.docs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetail(
                            name: 'Name:${snapshot.data.docs[index]['Name']}',
                            price:
                                'Price:${snapshot.data.docs[index]['Price']}',
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                               color: Colors.amber,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                            ),
                           
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            child: const Center(
                              child: Text("Image"),
                            ),
                          ),
                          Text(
                              'Product Name : ${snapshot.data.docs[index]['Name']}'),
                          Text('Price : ${snapshot.data.docs[index]['Price']}'),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: OutlinedButton(
                              onPressed: () {},
                              child: const Text("Remove product"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
