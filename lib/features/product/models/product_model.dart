// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'brand_model.dart';
// import 'product_attribute_model.dart';
// import 'product_variation_model.dart';

// class ProductModel {
//   String id;
//   int stock;
//   String? sku;
//   double price;
//   String title;
//   DateTime? date;
//   double salePrice;
//   String thumbnail;
//   bool? isFeatured;
//   BrandModel? brand;
//   String? description;
//   String? categoryId;
//   List<String>? images;
//   String productType;
//   List<ProductAttributeModel>? productAttributes;
//   List<ProductVariationModel>? productVariations;

//   ProductModel({
//     required this.id,
//     required this.stock,
//     this.sku,
//     required this.price,
//     required this.title,
//     this.date,
//     this.salePrice = 0.0,
//     required this.thumbnail,
//     this.isFeatured,
//     this.brand,
//     this.description,
//     this.categoryId,
//     this.images,
//     required this.productType,
//     this.productAttributes,
//     this.productVariations,
//   });

//   // Create empty func for clean code
//   static ProductModel empty() => ProductModel(
//       id: '', stock: 0, price: 0, title: '', thumbnail: '', productType: '');

//   // Json Format
//   toJson() {
//     return {
//       'SKU': sku,
//       'Stock': stock,
//       'Title': title,
//       'Price': price,
//       'SalePrice': salePrice,
//       'Thumbnail': thumbnail,
//       'IsFeatured': isFeatured,
//       'Brand': brand,
//       'Description': description,
//       'CategoryId': categoryId,
//       'Images': images,
//       'ProductType': productType,
//       'ProductAttributes': productAttributes != null
//           ? productAttributes!.map((e) => e.toJson()).toList()
//           : [],
//       'ProductVariations': productVariations != null
//           ? productVariations!.map((e) => e.toJson()).toList()
//           : [],
//     };
//   }

//   // Map Json oriented document snapshot from firebase to model
//   factory ProductModel.fromSnapshot(
//       DocumentSnapshot<Map<String, dynamic>> document) {
//     if(document.data() == null) return ProductModel.empty();
//     final data = document.data()!;
//     return ProductModel(
//         id: document.id,
//         stock: data['Stock'] ?? 0,
//         price: double.parse((data['Price'] ?? 0.0).toString()),
//         title: data['title'],
//         thumbnail: data['Thumbnail'] ?? '',
//         productType: data['ProductType'] ?? '',
//         salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
//         isFeatured: data['IsFeatured'] ?? false,
//         brand: BrandModel.fromjson(data['Brand']),
//         categoryId: data['CategoryId'] ?? '',
//         sku: data['Sku'],
//         description: data['Description'] ?? '',
//         images: data['Images'] != null ? List<String>.from(data['Images']) : [],
//         productAttributes: (data['ProductAttributes'] as List<dynamic>)
//             .map((e) => ProductAttributeModel.fromJson(e))
//             .toList(),
//         productVariations: (data['ProductVariations'] as List<dynamic>)
//             .map((e) => ProductVariationModel.fromjson(e))
//             .toList());
//   }

//   // Map Json-oriented document snapshot from firebase to model
//   factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
//     final data = document.data() as Map<String, dynamic>;
//     return ProductModel(
//       id: document.id,
//         stock: data['Stock'] ?? 0,
//         price: double.parse((data['Price'] ?? 0.0).toString()),
//         title: data['title'],
//         thumbnail: data['Thumbnail'] ?? '',
//         productType: data['ProductType'] ?? '',
//         salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
//         isFeatured: data['IsFeatured'] ?? false,
//         brand: BrandModel.fromjson(data['Brand']),
//         categoryId: data['CategoryId'] ?? '',
//         sku: data['Sku'],
//         description: data['Description'] ?? '',
//         images: data['Images'] != null ? List<String>.from(data['Images']) : [],
//         productAttributes: (data['ProductAttributes'] as List<dynamic>)
//             .map((e) => ProductAttributeModel.fromJson(e))
//             .toList(),
//         productVariations: (data['ProductVariations'] as List<dynamic>)
//             .map((e) => ProductVariationModel.fromjson(e))
//             .toList());
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String title;
  final String thumbnail;
  final double price;
  final double salePrice;
  final String productType;
  final Brand? brand;

  ProductModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.salePrice,
    required this.productType,
    this.brand,
  });

  // Create empty func for clean code
  factory ProductModel.empty() {
    return ProductModel(
      id: '',
      title: '',
      thumbnail: '',
      price: 0.0,
      salePrice: 0.0,
      productType: '',
      brand: null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'brand': brand?.toMap(),
      'price': price,
      'salePrice': salePrice,
      'thumbnail': thumbnail,
      'productType': productType,
    };
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return ProductModel(
      id: snapshot.id,
      title: data['title'] ?? '',
      brand: _parseBrand(data['brand']),
      price: data['price']?.toDouble() ?? 0.0,
      salePrice: data['salePrice']?.toDouble() ?? 0.0,
      thumbnail: data['thumbnail'] ?? '',
      productType: data['productType'] ?? '',
    );
  }

  static Brand? _parseBrand(dynamic data) {
    if (data == null) {
      return null;
    }
    if (data is Map<String, dynamic>) {
      return Brand.fromMap(data);
    }
    if (data is String) {
      return Brand(name: data);
    }
    return null;
  }
}
//   factory ProductModel.fromDocumentSnapshot(DocumentSnapshot doc) {
//     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//     return ProductModel(
//       id: doc.id,
//       title: data['title'],
//       thumbnail: data['thumbnail'],
//       price: data['price'].toDouble(),
//       salePrice: data['salePrice'].toDouble(),
//       productType: data['productType'],
//       brand: data['brand'] != null ? Brand.fromMap(data['brand']) : null,
//     );
//   }
// }

class Brand {
  final String name;

  Brand({required this.name});

  factory Brand.fromMap(Map<String, dynamic> data) {
    return Brand(name: data['name'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
