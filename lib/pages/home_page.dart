import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_basic_23_model/models/product.dart';
import 'package:faker/faker.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final faker = Faker();

  @override
  Widget build(BuildContext context) {
    List<Product> dummyData = List.generate(100, (index) {
      return Product(
          "https://picsum.photos/id/$index/200",
          faker.food.restaurant(),
          Random().nextInt(100000),
          faker.lorem.sentence());
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Market Place"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GridTile(
            child: Image.network(dummyData[index].imageUrl),
            footer: Container(
              height: 80,
              alignment: Alignment.center,
              color: Colors.green.withOpacity(0.8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    dummyData[index].judul,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${dummyData[index].harga}",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    dummyData[index].deskripsi,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: dummyData.length,
      ),
    );
  }
}
