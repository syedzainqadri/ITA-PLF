class CartModel {
  int id;
  String product_id;
  int quantity;
  String image;
  String name;
  double price;
  double salePrice;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "product_id": product_id,
      "quantity": quantity,
      "product_name": name,
      "product_price": price,
      "product_sale_price": salePrice,
      "product_image": image
    };
    if (id != null) {
      map["id"] = id;
    }

    return map;
  }

  CartModel(
      {this.product_id,
      this.quantity,
      this.name,
      this.image,
      this.price,
      this.salePrice});

  CartModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    product_id = map["product_id"];
    quantity = map["quantity"];
    name = map["product_name"];
    price = map["product_price"];
    salePrice = map["product_sale_price"];
    image = map["product_image"];
  }
}
