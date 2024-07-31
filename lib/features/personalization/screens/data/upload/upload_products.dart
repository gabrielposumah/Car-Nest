import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product_share_suzuki/features/product/controllers/product_controller.dart';
import 'package:product_share_suzuki/features/product/models/product_attribute_model.dart';
import 'package:product_share_suzuki/features/product/models/product_model.dart';
import 'package:product_share_suzuki/features/product/models/product_variation_model.dart';
import 'package:product_share_suzuki/utils/constants/colors.dart';
import 'package:product_share_suzuki/utils/constants/size.dart';

class UploadProducts extends StatefulWidget {
  UploadProducts({super.key});

  @override
  State<UploadProducts> createState() => _UploadProductsState();
}

class _UploadProductsState extends State<UploadProducts> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _salePriceController = TextEditingController();
  final _brandController = TextEditingController();

  File? _image;
  final ProductController _productController = Get.find();

  Future<void> _pickImage() async {
    File? pickedImage = await _productController.pickImage();
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }

  Future<void> _uploadProduct() async {
    if (_formKey.currentState!.validate() && _image != null) {
      String imageUrl = await _productController.uploadImage(_image!);

      ProductModel product = ProductModel(
        id: '',
        title: _titleController.text,
        thumbnail: imageUrl,
        price: double.parse(_priceController.text),
        salePrice: double.parse(_salePriceController.text),
        productType: 'single',
        brand: Brand(name: _brandController.text),
      );

      await _productController.addProduct(product);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Product'),
        backgroundColor: Gcolors.dark,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Gsize.md),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Image Picker
                GestureDetector(
                  onTap: _pickImage,
                  child: _image == null
                      ? Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Gcolors.light,
                            borderRadius: BorderRadius.circular(Gsize.sm),
                          ),
                          child: const Icon(Iconsax.add,
                              size: 100, color: Gcolors.dark),
                        )
                      : Image.file(
                          _image!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(height: Gsize.md),

                // Title
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Gsize.sm)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the product title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: Gsize.md),

                // Price
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Gsize.sm)),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the product price';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: Gsize.md),

                // Sale Price
                TextFormField(
                  controller: _salePriceController,
                  decoration: InputDecoration(
                    labelText: 'Sale Price',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Gsize.sm)),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the product sale price';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: Gsize.md),

                // Brand
                TextFormField(
                  controller: _brandController,
                  decoration: InputDecoration(
                    labelText: 'Brand',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Gsize.sm)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the product brand';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: Gsize.md),

                // Upload Button
                ElevatedButton(
                  onPressed: _uploadProduct,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Gcolors.dark,
                    padding: const EdgeInsets.symmetric(vertical: Gsize.sm),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Gsize.sm),
                    ),
                  ),
                  child: const Text('Upload Product'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
