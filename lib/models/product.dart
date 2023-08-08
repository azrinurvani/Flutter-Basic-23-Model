import 'package:flutter/material.dart';

class Product {
  @required
  String judul;

  @required
  String imageUrl;

  @required
  int harga;

  @required
  String deskripsi;

  Product(this.imageUrl, this.judul, this.harga, this.deskripsi);
}
