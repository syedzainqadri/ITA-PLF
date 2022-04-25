import 'package:PLF/controllers/add_to_cart.dart';
import 'package:PLF/controllers/add_to_cart/add_to_cart.dart';
import 'package:PLF/models/cart_model.dart';
import 'package:PLF/views/Books/widgets/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../../controllers/get_products.dart';

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
    products = null;
    super.dispose();
  }

  var cartController = Get.put(CartController());
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
      backgroundColor: vibrantYellow,
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (productController.isListNull.value) {
          return Center(
            child: Text("No Books Found"),
          );
        } else {
          return LoadingOverlay(
            progressIndicator: Center(
              child: CircularProgressIndicator(),
            ),
            isLoading: false,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .05,
                    child: Image.network(
                        'https://childrensliteraturefestival.com/wp-content/uploads/2022/02/ssp-gray.png'),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .15,
                  padding: EdgeInsets.only(left: 20, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Container()),
                      Container(
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: vibrantWhite),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 30,
                              ),
                              onPressed: () {},
                            ),
                            Expanded(
                              child: TextField(
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
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(30),
                    width: MediaQuery.of(context).size.width,
                    color: vibrantYellow,
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                              primary: false,
                              itemCount: products.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                crossAxisCount: 2,
                              ),
                              // itemCount:
                              // productController.productsResponse.length,
                              itemBuilder: (context, index) {
                                return BookWidget(
                                  img: products[index]["images"][0]["src"],
                                  name: products[index]["name"],
                                  color: vibrantPink,
                                  darkBlue: vibrantPurple,
                                  context: context,
                                  bookId: products[index]["id"],
                                );
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
