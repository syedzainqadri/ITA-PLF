import 'dart:convert';
import 'package:PLF/models/cart_model.dart';
import 'package:PLF/views/Home/Widgets/home_navbar.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String tablecart = 'cart';
final String columnId = 'id';
final String product_id = 'product_id';
final String quantity = 'quantity';
final String product_name = 'product_name';
final String product_image = 'product_image';
final String product_price = 'product_price';

class CartController extends GetxController {
  var totalPrice = 0.obs;

  Database db;
  var isLoading = false.obs;
  var totalItem = 0.obs;
  var totalPrize = 0.obs;
  addPrize(val) {
    totalPrize(totalPrize.value + val).obs;
  }

  var products = <Map>[].obs;
  Future open() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          '''
create table $tablecart ( 
  $columnId integer primary key autoincrement, 
  $product_id text not null,
  $quantity integer not null,
    $product_name text not null,
  $product_image text not null,
    $product_price double not null

  )
''');
    });
  }

  Future<CartModel> insert(CartModel cart) async {
    bool found = false;
    int q = 0;
    isLoading(true).obs;
    final items = await getCartItems();
    if (items != null) {
      for (var item in items) {
        if (item["product_id"] == cart.product_id) {
          print(" already in");
          found = true;
          q = item["quantity"];
        }
      }
    }
    if (found) {
      CartModel cart1 = CartModel(
          quantity: q + 1,
          price: cart.price,
          image: cart.image,
          name: cart.name,
          product_id: cart.product_id);
      updateCart(cart1);
      print(" data updated");
    } else {
      cart.id = await db.insert(
        tablecart,
        cart.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print(" data inserted");
    }

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

  clearData() {
    db.execute("delete from " + tablecart);
  }

  getCartItems() async {
    totalPrice(0).obs;

    /// we will make the product equal to null here
    isLoading(true).obs;
    List<Map> maps = await db.query(
      tablecart,
      columns: [
        columnId,
        quantity,
        product_id,
        product_name,
        product_image,
        product_price
      ],
    );
    print("response is: ${maps.length} ${maps}");
    if (maps.length > 0) {
      products.value = maps;
      for (var item in maps) {
        print("q is: ${item["quantity"].toString()}");
        totalPrice(totalPrice.value +
                ((item["quantity"]) * (item["product_price"]).toInt()))
            .obs;
      }
      print(" total price is: ${totalPrice.value}");
      isLoading(false).obs;
      return maps;
      // return CartModel.fromMap(maps);
    }
    isLoading(false).obs;
    return null;
  }

  Future<int> delete({int id}) async {
    final result =
        await db.delete(tablecart, where: '$product_id = ?', whereArgs: [id]);
    getCount();
    getCartItems();
    return result;
  }

  Future<int> updateCart(CartModel cart) async {
    final result = await db.update(tablecart, cart.toMap(),
        where: '$product_id = ?', whereArgs: [cart.product_id]);

    getCount();
    getCartItems();
    return result;
  }

  Future close() async => db.close();
}
