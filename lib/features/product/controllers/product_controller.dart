import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:product_share_suzuki/features/product/models/product_model.dart';
import 'package:product_share_suzuki/utils/popups/loader.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeatureProduct();
    super.onInit();
  }

  void fetchFeatureProduct() async {
    try{
      // Show loader while fetching data
      isLoading.value = true;

      // Fetch product
      final products = await productRepository.getFeaturedProducts();

      // Assign Product
      featuredProducts.assignAll(products);
    } catch(e){
      Gloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
    
  }
}