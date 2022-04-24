import 'package:PLF/controllers/add_to_cart.dart';
import 'package:PLF/controllers/add_to_cart/add_to_cart.dart';
import 'package:PLF/models/cart_model.dart';
import 'package:PLF/views/Books/widgets/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../controllers/get_products.dart';
import '../Cart/cart.dart';

class BookStore extends StatefulWidget {
  @override
  _BookStoreState createState() => _BookStoreState();
}

class _BookStoreState extends State<BookStore> {
  var productController = Get.put(ProductsController());
  var addToCartController = Get.put(AddToCart());
  var products;
  int count = 0;
  get() async {
    products = await productController.getProduct();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    products = null;
    super.dispose();
  }

  var cartController = Get.put(CartController());
  var searchController = TextEditingController();
  CartModel cart = CartModel(product_id: "12", quantity: 3);
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      get();

      cartController.open();

      cartController.insert(cart);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (productController.isListNull.value) {
          return Center(
            child: Text("No Books Found"),
          );
        } else {
          // for (var p in products) {

          //   count++;
          // }
          //
          // print("count is:  $count");
          return LoadingOverlay(
            progressIndicator: Center(
              child: CircularProgressIndicator(),
            ),
            isLoading: false,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://childrensliteraturefestival.com/wp-content/uploads/2022/02/ssp-gray.png"))),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 30, top: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Container()),
                        Container(
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () {
                                  if (searchController.text != null) {
                                    productController.getProduct();
                                  }
                                },
                              ),
                              Expanded(
                                child: TextFormField(
                                  onSaved: (val) {
                                    productController.getProduct();
                                  },
                                  controller: searchController,
                                  style: TextStyle(
                                      fontSize: 18, fontFamily: 'circe'),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Search for Books"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(30),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                              primary: false,
                              itemCount: products != null ? products.length : 0,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                crossAxisCount: 2,
                              ),

                              // ignore: missing_return
                              itemBuilder: (context, index) {
                                print(
                                    "search controller: ${searchController.text}");
                                if (searchController.text != null ||
                                    searchController.text != "") {
                                  print("in if");

                                  if (products[index]["name"]
                                      .toString()
                                      .toLowerCase()
                                      .contains(searchController.text
                                          .toLowerCase())) {
                                    print(" in nested if");
                                    return bookWidget(
                                      img: products[index]["images"][0]["src"],
                                      name: products[index]["name"],
                                      color: backgroundColor,
                                      darkBlue: darkBlue,
                                      context: context,
                                      bookId: products[index]["id"],
                                      bookDesc: products[index]["description"],
                                    );
                                  } else {
                                    return Offstage();
                                  }
                                } else if (searchController.text == null ||
                                    searchController.text.isEmpty) {
                                  return bookWidget(
                                    img: products[index]["images"][0]["src"],
                                    name: products[index]["name"],
                                    color: backgroundColor,
                                    darkBlue: darkBlue,
                                    context: context,
                                    bookId: products[index]["id"],
                                    bookDesc: products[index]["description"],
                                  );
                                }
                              }),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
