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

  deletaData() async {
    await products.doc().delete();
  }

  deleteData(id) async {
    return FirebaseFirestore.instance.collection("Products").doc(id).delete();
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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.7,
                  children: List.generate(
                    snapshot.data.docs.length,
                    (index) {
                      var docid = snapshot.data.docs[index].id;
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                name:
                                    'Name:${snapshot.data.docs[index]['Name']}',
                                price:
                                    'Price:${snapshot.data.docs[index]['Price']}',
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey.shade300,),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                ),
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                child: const Center(
                                  child: Text("Image"),
                                ),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                'Name : ${snapshot.data.docs[index]['Name']}',
                              ),
                              Text(
                                  'Price : ${snapshot.data.docs[index]['Price']}'),
                              GestureDetector(
                                onTap: () {
                                  FirebaseFirestore.instance
                                      .collection("products")
                                      .doc(docid)
                                      .delete();
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
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
