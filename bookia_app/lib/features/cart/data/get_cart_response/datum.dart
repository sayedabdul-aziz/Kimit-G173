class CartModel {
  int? cartId;
  int? price;
  String? qty;
  int? totalPrice;
  int? bookId;

  CartModel({this.cartId, this.price, this.qty, this.totalPrice, this.bookId});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        cartId: json['cartId'] as int?,
        price: json['price'] as int?,
        qty: json['qty'] as String?,
        totalPrice: json['totalPrice'] as int?,
        bookId: json['bookId'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'cartId': cartId,
        'price': price,
        'qty': qty,
        'totalPrice': totalPrice,
        'bookId': bookId,
      };
}
