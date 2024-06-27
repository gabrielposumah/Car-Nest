import 'package:cloud_firestore/cloud_firestore.dart';

import 'brand_model.dart';
import 'product_attribute_model.dart';
import 'product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.stock,
    this.sku,
    required this.price,
    required this.title,
    this.date,
    this.salePrice = 0.0,
    required this.thumbnail,
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images,
    required this.productType,
    this.productAttributes,
    this.productVariations,
  });

  // Create empty func for clean code
  static ProductModel empty() => ProductModel(id: '', stock: 0, price: 0, title: '', thumbnail: '', productType: '');

  // Json Format
  toJson() {
    return {
      'SKU' : sku,
      'Stock' : stock,
      'Title' : title,
      'Price' : price,
      'SalePrice' : salePrice,
      'Thumbnail' : thumbnail,
      'IsFeatured' : isFeatured,
      'Brand' : brand,
      'Description' : description,
      'CategoryId' : categoryId,
      'Images' : images,
      'ProductType' : productType,
      'ProductAttributes' : productAttributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],
      'ProductVariations' : productVariations != null ? productVariations!.map((e) => e.toJson()).toList() : [],
    };
  }

  // Map Json oriented document snapshot from firebase to model
  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return ProductModel(id: document.id, stock: data['Stock'] ?? 0, price: double.parse((data['Price'] ?? 0.0).toString()), 
    title: data['title'], thumbnail: data['Thumbnail'] ?? '', productType: data['ProductType'] ?? '', 
    salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()), isFeatured: data['IsFeatured'] ?? false,
    brand: BrandModel.fromjson(data['Brand']), categoryId: data['CategoryId'] ?? '',
    sku: data['Sku'],
    description: data['Description'] ?? '', images: data['Images'] != null ? List<String>.from(data['Images']) : [],
    productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
    productVariations:(data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromjson(e)).toList()
    );
  }
  
  //
}