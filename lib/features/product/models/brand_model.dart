import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  // Empty Helper Function
  static BrandModel empty() => BrandModel(id: '', name: '', image: '');

  // Convert model to Json structure so that you can store data in firebase
  toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'isFeatured': isFeatured,
        'productsCount': productsCount,
      };

  // Map Json oriented document snapshot from firebase to usermodel
  factory BrandModel.fromjson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: document['id'] ?? '',
      name: document['name'] ?? '',
      image: document['image'] ?? '',
      isFeatured: document['isFeatured'] ?? '',
      productsCount: document['productsCount'] ?? '',
    );
  }

  // Map Json oriented documetn snapshot from firebase to usermodel
  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() != null) {
      final data = document.data()!;

      // Map json record to the model
      return BrandModel(id: id, name: name, image: image)
    } 
  }
}
