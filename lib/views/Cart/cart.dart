import 'package:PLF/controllers/add_to_cart/add_to_cart.dart';
import 'package:PLF/models/cart_model.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:PLF/views/Chekout/checkout.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var cartController = Get.put(CartController());
  double totalPrice = 0.0;
  // get() async {
  //   print(" in get");
  //   products = await productController.getProduct();
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    totalPrice = 0.0;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cartController.getCartItems();
      cartController.getCount();
    });
    super.initState();
  }

  @override
  Widget build(context) {
    totalPrice = 0.0;
    return Scaffold(
      backgroundColor: vibrantAmber,
      extendBodyBehindAppBar: true,
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
              padding: EdgeInsets.only(top: 8),
              child: Badge(
                position: BadgePosition.topEnd(),
                badgeContent: Text(cartController.totalItem.value.toString()),
                child: InkWell(
                  child: Icon(
                    Icons.shopping_cart,
                    color: black,
                    size: 30,
                  ),
                ),
              ),
            );
          }),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Obx(() {
        print("product is : ${cartController.products}");
        if (cartController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (cartController.totalItem < 1) {
          return Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Cart Empty"),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(bottom: 20, right: 30, left: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: vibrantOrange),
                      child: Center(
                        child: Text(
                          "Continue To Shop",
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
          );
        } else {
          double totalPrice1 = 0.0;
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

                            // ignore: missing_return
                            itemCount: cartController.totalItem.value,
                            itemBuilder: (context, index) {
                              totalPrice1 = totalPrice1 +
                                  (double.parse((cartController.products[index]["product_price"]).toString()) *
                                      double.parse((cartController.products[index]["quantity"]).toString()));
                              print("");
                              return itemsCard(
                                  img: cartController.products[index]
                                      ["product_image"],
                                  itemName: cartController.products[index]
                                      ["product_name"],
                                  itemPrice: cartController.products[index]
                                      ["product_price"],
                                  totalItems: cartController.products[index]
                                      ["quantity"],
                                  darkColor: darkBlue,
                                  product_id: cartController.products[index]
                                      ["product_id"]);
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 18),
                        child: Obx(() {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    cartController.totalPrice.toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "- - - - - - - - - - - - - - - - - - - - - - -",
                                style: TextStyle(fontSize: 25),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Subtotal",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    cartController.totalPrice.toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(CheckOut(
                                    totalPrice: cartController.totalPrice,
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
                                      color: vibrantOrange),
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
                          );
                        }),
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
          color: white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 150,
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
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                        child: Text(
                          itemName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 6.0, right: 8.0, left: 8.0),
                          child: Text(
                              "RS: " + itemPrice.toString(),
                            style: TextStyle(
                                color: vibrantRed, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: black,
                                  size: 15,
                                ),
                                onPressed: () {
                                  if (totalItems > 1) {
                                    var cart = CartModel(
                                        product_id: product_id,
                                        quantity: totalItems - 1,
                                        price: itemPrice,
                                        image: img,
                                        name: itemName);
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
                                  fontSize: 15,
                                  color: black,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: black,
                                  size: 15,
                                ),
                                onPressed: () {
                                  var cart = CartModel(
                                      product_id: product_id,
                                      quantity: totalItems + 1,
                                      price: itemPrice,
                                      image: img,
                                      name: itemName);
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
