import 'dart:io';

import 'package:get/get.dart';
import 'package:product_share_suzuki/data/repositories/products/product_repository.dart';
import 'package:product_share_suzuki/features/product/models/product_model.dart';
import 'package:product_share_suzuki/utils/enums/enums.dart';
import 'package:product_share_suzuki/utils/popups/loader.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final productRepository = Get.put(ProductRepository());
  final products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchFeatureProduct() async {
    try {
      // Show loader while fetching data
      isLoading.value = true;

      // Fetch product
      final products = await productRepository.getFeaturedProducts();

      // Assign Product
      featuredProducts.assignAll(products);
    } catch (e) {
      Gloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Add product

  // Get the product price or price range for variations
  // String getProductPrice(ProductModel product) {
  //   double smallestPrice = double.infinity;
  //   double largestPrice = 0.0;

  //   // if no variation exist, return the simple price or sale price
  //   if (product.productType == ProductType.single.toString()) {
  //     return (product.salePrice > 0 ? product.salePrice : product.price)
  //         .toString();
  //   } else {
  //     // calculate the smalles and largest prices among variations
  //     for (var variation in product.productVariations!) {
  //       // Determine the price to consider (sale price if avalaible, otherwise regular price)
  //       double priceToConsider =
  //           variation.salePrice > 0.0 ? variation.salePrice : variation.price;

  //       // update smallest and largest prices
  //       if (priceToConsider < smallestPrice) {
  //         smallestPrice = priceToConsider;
  //       }

  //       if (priceToConsider > largestPrice) {
  //         largestPrice > priceToConsider;
  //       }
  //     }

  //     // if smallest and largest price are the same, return a single price
  //     if (smallestPrice.isEqual(largestPrice)) {
  //       return largestPrice.toString();
  //     } else {
  //       // Otherwise return a price range
  //       return '$smallestPrice - \$$largestPrice';
  //     }
  //   }
  // }

  // Calculate discount percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  // Check produk stack status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  // Future<void> addProduct(ProductModel product) async {
  //   try {
  //     await productRepository.addProduct(product);
  //   } catch (e) {
  //     throw Exception('Failed to add product: $e');
  //   }
  // }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    try {
      List<ProductModel> fetchedProducts =
          await productRepository.fetchProducts();
      if (fetchedProducts.isNotEmpty) {
        featuredProducts.value = fetchedProducts;
      }
      print('Fetched Products: ${fetchedProducts.length}');
    } catch (e) {
      print('Error fetching products: $e');
    }
    isLoading.value = false;
  }

  Future<void> addProduct(ProductModel product) async {
    isLoading.value = true;
    await productRepository.addProduct(product);
    await fetchProducts();
    isLoading.value = false;
  }

  Future<void> updateProduct(ProductModel product) async {
    isLoading.value = true;
    await productRepository.updateProduct(product);
    await fetchProducts();
    isLoading.value = false;
  }

  Future<void> deleteProduct(String productId) async {
    isLoading.value = true;
    await productRepository.deleteProduct(productId);
    await fetchProducts();
    isLoading.value = false;
  }

  Future<File?> pickImage() async {
    return await productRepository.pickImage();
  }

  Future<String> uploadImage(File image) async {
    return await productRepository.uploadImage(image);
  }
}
