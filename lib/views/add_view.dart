import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app3/models/product_model.dart';
import 'package:store_app3/services/add_product.dart';
import 'package:store_app3/widgets/product_form.dart';

Future<ProductModel> createAlbum(String title) async {
  final response = await http.post(
    Uri.parse('https://fakestoreapi.com/products'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'title': title,
      'price': 25,
      'description': 'Hello',
      'category': 'jewelary',
      'image': 'assets/images/photo_2022-10-05_01-14-30.jpg'
    }),
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    ProductModel product = ProductModel.fromJson(data);

    return product;
  } else {
    throw Exception('Failed to create album.');
  }
}

// class Album {
//   final String title;
//   final dynamic price;
//   final String description;
//   final String image;
//   final String category;

//   Album(
//       {required this.title,
//       required this.price,
//       required this.description,
//       required this.image,
//       required this.category});

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       title: json['title'],
//       price: json['price'],
//       category: json['category'],
//       image: json['image'],
//       description: json['description']

//     );
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  Future<ProductModel>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
       
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = AddProduct().addProduct(title: _controller.text);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<ProductModel> buildFutureBuilder() {
    return FutureBuilder<ProductModel>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ProductForm(productModel: snapshot.data!);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
