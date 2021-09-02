import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteProvider {
  final String? _CARTDB = kReleaseMode ? "CARTDB" : "CARTDBDEV";
  static Database? database;
  Future openDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _CARTDB);
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE $_CARTDB(id INTEGER PRIMARY KEY, name TEXT, images TEXT, basePrice INTEGER, priceDiscount INTEGER, amount INTEGER, branchId TEXT)');
      },
    );
  }

  // Future<int> deleteProductInCart(Product product) async => database!.delete("$_CARTDB", where: 'id = ?', whereArgs: [product.id]);

  // Future<int> insertProductIToCart(Product product, String size, String color) async {
  //   String imgs = product.images.join("~~~");
  //   String branchIDs = product.branchId.join("~~~");
  //   log(product.images.join("~~~"));
  //   String sql =
  //       'INSERT INTO $_CARTDB(id, name, images, basePrice, priceDiscount, amount, branchId) VALUES("${product.id}", "${product.name}", "$imgs", ${product.basePrice}, ${product.priceDiscount}, "${product.amount}", "$branchIDs")';
  //   return await database.transaction((txn) async => await txn.rawInsert(sql));
  // }

  // Future<Product> getProductById(int idProduct) async {
  //   List<Map<String, dynamic>> list = await database.query('$_CARTDB', where: 'id = ?', whereArgs: [idProduct]);
  //   if (list.length == 0) return null;
  //   Map<String, dynamic> productMap = Map.of(list[0]);
  //   productMap["images"] = [];
  //   productMap["branchId"] = [];
  //   Product product = Product.fromJson(productMap);
  //   product.images = list[0]["images"].toString().split("~~~");
  //   product.branchId = list[0]["branchId"].toString().split("~~~").map((e) => int.tryParse(e)).toList();
  //   return product;
  // }

  // Future<List<Product>> getAllProductInCart() async {
  //   List<Map<String, dynamic>> list = await database.query('$_CARTDB');
  //   if (list.length == 0) return [];
  //   return list.map((e) {
  //     Map<String, dynamic> productMap = Map.of(e);
  //     productMap["images"] = [];
  //     productMap["branchId"] = [];
  //     Product product = Product.fromJson(productMap);
  //     product.images = e["images"].toString().split("~~~");
  //     product.branchId = e["branchId"].toString().split("~~~").map((e) => int.tryParse(e)).toList();
  //     return product;
  //   }).toList();
  // }

  // Future<void> updateProductInCart(Product product) async {
  //   Map<String, dynamic> values = {
  //     "id": product.id,
  //     "name": product.name,
  //     "images": product.images.join("~~~"),
  //     "basePrice": product.basePrice,
  //     "priceDiscount": product.priceDiscount,
  //     "amount": product.amount,
  //     "branchId": product.branchId.join("~~~"),
  //   };
  //   await database.update('$_CARTDB', values, where: 'id = ?', whereArgs: [product.id]);
  // }

  // Future deleteCart() async {
  //   database.delete("$_CARTDB");
  // }

  // Future close() async => database.close();
}
