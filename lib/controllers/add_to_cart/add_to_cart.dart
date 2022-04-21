import 'dart:convert';

import 'package:PLF/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';

final String tablecart = 'cart';
final String columnId = 'id';
final String product_id = 'product_id';
final String quantity = 'quantity';

class CartController extends GetxController {
  Database db;
  var isLoading = false.obs;
  var totalItem = 0.obs;

  Future open() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tablecart ( 
  $columnId integer primary key autoincrement, 
  $product_id text not null,
  $quantity integer not null)
''');
    });
  }

  Future<CartModel> insert(CartModel cart) async {
    bool found = false;
    int q = 0;
    isLoading(true).obs;
    final items = await getCartItems();
    for (var item in items) {
      if (item["product_id"] == cart.product_id) {
        print(" already in");
        found = true;
        q = item["quantity"];
      }
    }
    if (found) {
      CartModel cart1 = CartModel(quantity: q + 1, product_id: cart.product_id);
      updateCart(cart1);
    } else {
      cart.id = await db.insert(
        tablecart,
        cart.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    print(" data inserted");
    getCount();
    isLoading(false).obs;
    return cart;
  }

  getCount() async {
    isLoading(true).obs;
    int count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tablecart'));
    print(" total count is:  $count");
    totalItem.value = count;
    isLoading(false).obs;
  }

  getCartItems() async {
    List<Map> maps = await db.query(
      tablecart,
      columns: [columnId, quantity, product_id],
      // where: '$columnId = ?',
      // whereArgs: [id]
    );
    print("response is: ${maps}");
    if (maps.length > 0) {
      return maps;
      // return CartModel.fromMap(maps);
    }
    return null;
  }

  Future<int> delete({int id}) async {
    final result =
        await db.delete(tablecart, where: '$product_id = ?', whereArgs: [id]);
    getCount();
    return result;
  }

  Future<int> updateCart(CartModel cart) async {
    final result = await db.update(tablecart, cart.toMap(),
        where: '$product_id = ?', whereArgs: [cart.product_id]);

    getCount();
    return result;
  }

  Future close() async => db.close();
}

/// test
