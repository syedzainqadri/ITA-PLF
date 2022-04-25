import 'package:PLF/controllers/add_to_cart/add_to_cart.dart';
import 'package:PLF/controllers/get_products.dart';
import 'package:PLF/models/cart_model.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:PLF/views/Chekout/checkout.dart';
import 'package:PLF/views/Home/HomePage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

// class CartScreen extends StatefulWidget {
//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   @override
//   Widget build(context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CartPage(),
//     );
//   }
// }

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var cartController = Get.put(CartController());
  var products;
  double totalPrice = 0.0;
  get() async {
    print(" in get");
    products = await productController.getProduct();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    products = null;
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    totalPrice = 0.0;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      get();
      cartController.getCartItems();
      cartController.getCount();
    });
    super.initState();
  }

  var productController = Get.put(ProductsController());

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
        ),
        title: Text(
          "Cart",
          style: TextStyle(
            color: Color.fromARGB(255, 53, 53, 53),
          ),
        ),
        actions: [
          Obx(() {
            if (cartController.isLoading.value) {
              return Offstage();
            }
            return Padding(
              padding: EdgeInsets.only(top: 10.0, right: 10),
              child: Text(
                cartController.totalItem.value.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            );
          }),
        ],
      ),
      body: Obx(() {
        if (productController.isLoading.value ||
            cartController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (productController == null) {
          return Center(
            child: Text("No Books Found"),
          );
        } else {
          print("  products : ${products}");
          return LoadingOverlay(
            progressIndicator: Center(
              child: CircularProgressIndicator(),
            ),
            isLoading: false,
            child: Container(
              color: Colors.transparent,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: Get.height * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: cartController.totalItem.value,
                            // ignore: missing_return
                            itemBuilder: (context, index) {
                              for (int i = 0; i < products.length; i++) {
                                print(' in side the loop ');
                                print(
                                    "cart id: ${cartController.products[index]["$product_id"]}");
                                print(" product id: ${products[i]["id"]}");

                                if (cartController.products[index]["product_id"]
                                        .toString() ==
                                    products[i]["id"].toString()) {
                                  print(' matched');
                                  // cartController.addPrize((cartController
                                  //         .products[index]["quantity"]) *
                                  //     int.parse(products[i]["price"]));
                                  totalPrice = totalPrice +
                                      (double.parse(products[i]["price"]) *
                                          cartController.products[index]
                                              ["quantity"]);

                                  return itemsCard(
                                      img: products[i]["images"][0]["src"],
                                      itemName: products[i]["name"],
                                      itemPrice: products[i]["price"],
                                      totalItems: cartController.products[index]
                                          ["quantity"],
                                      darkColor: darkBlue,
                                      product_id: cartController.products[index]
                                          ["product_id"]);
                                } else {
                                  return Offstage();
                                }
                              }
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                ),
                                Text(
                                  totalPrice.toString(),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Discount",
                                ),
                                Text(
                                  "0.00",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "- - - - - - - - - - - - - - - - - - - - - - - - - - - -",
                              style: TextStyle(fontSize: 25),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Subtotal",
                                ),
                                Text(
                                  totalPrice.toString(),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(CheckOut(
                                  totalPrice: totalPrice,
                                  products: cartController.products.value,
                                ));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(15),
                                margin: EdgeInsets.only(
                                    bottom: 20, right: 30, left: 30),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: darkBlue),
                                child: Center(
                                  child: Text(
                                    "Continue to Checkout",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'circe',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      }),
    );
  }

  itemsCard({img, itemName, itemPrice, totalItems, darkColor, product_id}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 6,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          // color: cardColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Card(
          elevation: 2.0,
          color: cardColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Container(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: img,
                      fit: BoxFit.cover,
                      placeholder: (context, val) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.image),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            itemName,
                          ),
                          Text(
                            itemPrice + " RS",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: darkColor,
                                ),
                                onPressed: () {
                                  if (totalItems > 1) {
                                    var cart = CartModel(
                                        product_id: product_id,
                                        quantity: totalItems - 1);
                                    cartController.updateCart(cart);
                                  } else {
                                    cartController.delete(
                                        id: int.parse(product_id));
                                  }
                                  setState(() {
                                    if (totalItems != 0) {
                                      totalItems--;
                                    }
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                totalItems.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: darkColor,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: darkColor,
                                ),
                                onPressed: () {
                                  var cart = CartModel(
                                      product_id: product_id,
                                      quantity: totalItems + 1);
                                  cartController.updateCart(cart);
                                  setState(() {
                                    totalItems++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  inputField(width, height, labelText, obscureText) {
    return SizedBox(
      width: width > height ? height / 1.3 : width / 1.3,
      height: 55,
      child: TextField(
        keyboardAppearance: Brightness.dark,
        style: const TextStyle(
          color: Color.fromARGB(255, 27, 26, 26),
        ),
        autofocus: false,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 27, 26, 26), width: 1.0),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 27, 26, 26), width: 1.0),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 27, 26, 26), width: 0.8),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          ),
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 82, 79, 79),
          ),
        ),
      ),
    );
  }
}
