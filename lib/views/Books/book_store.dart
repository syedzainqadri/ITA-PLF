import 'package:PLF/controllers/add_to_cart.dart';
import 'package:PLF/controllers/add_to_cart/add_to_cart.dart';
import 'package:PLF/controllers/get_caterories_controller/get_categories_controller.dart';
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
  var categoryController = Get.put(CategoriesController());
  var products;

  var categories;
  int count = 0;
  var selectedCatId;
  bool catCheck = false;
  get() async {
    products = await productController.getProduct();
  }

  getCategories() async {
    categories = await categoryController.getCategoriesList();
  }

  @override
  void dispose() {
    products = null;
    categories = null;
    super.dispose();
  }

  var cartController = Get.put(CartController());
  @override
  void initState() {
    // TODO: implement initState
    catCheck = false;
    productController.updateApiUrl(
        "products?per_page=100&stock_status=instock&status=publish");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      get();
      cartController.open();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vibrantYellow,
      body: Column(
        children: [
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
                    size: 25,
                  ),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(fontSize: 18, fontFamily: 'circe'),
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Search for Books"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 10),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          getCategories();
                        });

                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            builder: (context) {
                              return StatefulBuilder(builder:
                                  (context, StateSetter customSetState) {
                                return profits_bottomsheet(customSetState);

                                // profits_bottomsheet();
                              });
                            });
                      },
                      child: Icon(Icons.photo_filter_sharp)),
                  height: 49,
                ),
              ],
            ),
          ),
          Obx(() {
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
                                      relatedProducts: products[index]
                                          ['related_ids'],
                                      bookId: products[index]["id"],
                                      subText: products[index]['description'],
                                      price: products[index]['price'],
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
        ],
      ),
    );
  }

  profits_bottomsheet(mystate) {
    print("in else ");
    print(categoryController.categoriesList.value);
    return Container(
      height: Get.size.height * 0.7,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Obx(() {
        if (categoryController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (categoryController.isListNull.value) {
          return Text(" No Cat");
        } else {
          print("categories list is:  ${categories}");
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 40, left: 32, right: 31),
                        child: Text(
                          "Filter",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      InkWell(
                        child: Text(" Apply Filters"),
                        onTap: () {
                          if (selectedCatId == null) {
                            productController.updateApiUrl(
                                "products?per_page=100&stock_status=instock&status=publish");
                          } else {
                            productController.updateApiUrl(
                                "products?category=$selectedCatId");
                          }
                          Navigator.pop(context);
                          productController.getProduct();
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, left: 15, right: 15),
                  child: Text("Select Category",
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'SourceSansPro-Regular',
                          fontWeight: FontWeight.w400,
                          color: black)),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: categories.length,
                      itemBuilder: (_, index) {
                        var item = categories[index];
                        print(
                          " category single item: ${item}",
                        );
                        if (int.parse(item["count"].toString()) > 0) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            margin: EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item["name"].toString(),
                                  style: TextStyle(color: black, fontSize: 14),
                                ),
                                InkWell(
                                  onTap: () {
                                    mystate(() {
                                      catCheck = !catCheck;
                                      selectedCatId = item["id"];
                                    });
                                  },
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: catCheck
                                        ? Icon(
                                            Icons.check,
                                            size: 15,
                                          )
                                        : Offstage(),
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: black, width: 1),
                                        color: catCheck
                                            ? vibrantAmber
                                            : Colors.white),
                                  ),
                                )
                              ],
                            ),
                          );
                        } else {
                          return Offstage();
                        }
                      }),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
