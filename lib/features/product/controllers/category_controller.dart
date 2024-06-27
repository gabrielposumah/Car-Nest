import 'package:get/get.dart';
import 'package:product_share_suzuki/data/repositories/categories/category_repository.dart';
import 'package:product_share_suzuki/features/product/models/category_model.dart';
import 'package:product_share_suzuki/utils/popups/loader.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories= <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  // -- Load category data
  Future<void> fetchCategories() async {
    try {

      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source (Firestore,API, etc)
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    } catch (e){
      Gloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }

  // Load selected category data

  // Get category or Sub-Category Products
}