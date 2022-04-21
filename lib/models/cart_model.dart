class CartModel {
  int id;
  String product_id;
  int quantity;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "product_id": product_id,
      "quantity": quantity,
    };
    if (id != null) {
      map["id"] = id;
    }

    return map;
  }

  CartModel({this.product_id, this.quantity});

  CartModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    product_id = map["product_id"];
    quantity = map["quantity"];
  }
}
