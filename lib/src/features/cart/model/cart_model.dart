import 'dart:convert';
import 'package:flutter/foundation.dart';

class Cart {
  int? id;
  List<Products>? products;
  int? total;
  int? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;
  Cart({
    this.id,
    this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

  Cart copyWith({
    int? id,
    List<Products>? products,
    int? total,
    int? discountedTotal,
    int? userId,
    int? totalProducts,
    int? totalQuantity,
  }) {
    return Cart(
      id: id ?? this.id,
      products: products ?? this.products,
      total: total ?? this.total,
      discountedTotal: discountedTotal ?? this.discountedTotal,
      userId: userId ?? this.userId,
      totalProducts: totalProducts ?? this.totalProducts,
      totalQuantity: totalQuantity ?? this.totalQuantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'products': products?.map((x) => x.toMap()).toList(),
      'total': total,
      'discountedTotal': discountedTotal,
      'userId': userId,
      'totalProducts': totalProducts,
      'totalQuantity': totalQuantity,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'] != null ? map['id'] as int : null,
      products: map['products'] != null
          ? List<Products>.from(
              (map['products'] as List<dynamic>).map<Products?>(
                (x) => Products.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      total: map['total'] != null ? map['total'] as int : null,
      discountedTotal:
          map['discountedTotal'] != null ? map['discountedTotal'] as int : null,
      userId: map['userId'] != null ? map['userId'] as int : null,
      totalProducts:
          map['totalProducts'] != null ? map['totalProducts'] as int : null,
      totalQuantity:
          map['totalQuantity'] != null ? map['totalQuantity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cart(id: $id, products: $products, total: $total, discountedTotal: $discountedTotal, userId: $userId, totalProducts: $totalProducts, totalQuantity: $totalQuantity)';
  }

  @override
  bool operator ==(covariant Cart other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        listEquals(other.products, products) &&
        other.total == total &&
        other.discountedTotal == discountedTotal &&
        other.userId == userId &&
        other.totalProducts == totalProducts &&
        other.totalQuantity == totalQuantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        products.hashCode ^
        total.hashCode ^
        discountedTotal.hashCode ^
        userId.hashCode ^
        totalProducts.hashCode ^
        totalQuantity.hashCode;
  }
}

class Products {
  int? id;
  String? title;
  int? price;
  int? quantity;
  int? total;
  num? discountPercentage;
  int? discountedPrice;
  String? thumbnail;
  Products({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedPrice,
    this.thumbnail,
  });

  Products copyWith({
    int? id,
    String? title,
    int? price,
    int? quantity,
    int? total,
    num? discountPercentage,
    int? discountedPrice,
    String? thumbnail,
  }) {
    return Products(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      total: total ?? this.total,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'quantity': quantity,
      'total': total,
      'discountPercentage': discountPercentage,
      'discountedPrice': discountedPrice,
      'thumbnail': thumbnail,
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      total: map['total'] != null ? map['total'] as int : null,
      discountPercentage: map['discountPercentage'] != null
          ? map['discountPercentage'] as num
          : null,
      discountedPrice:
          map['discountedPrice'] != null ? map['discountedPrice'] as int : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Products(id: $id, title: $title, price: $price, quantity: $quantity, total: $total, discountPercentage: $discountPercentage, discountedPrice: $discountedPrice, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(covariant Products other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.price == price &&
        other.quantity == quantity &&
        other.total == total &&
        other.discountPercentage == discountPercentage &&
        other.discountedPrice == discountedPrice &&
        other.thumbnail == thumbnail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        quantity.hashCode ^
        total.hashCode ^
        discountPercentage.hashCode ^
        discountedPrice.hashCode ^
        thumbnail.hashCode;
  }
}
