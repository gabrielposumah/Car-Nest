import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product_share_suzuki/data/repositories/categories/category_repository.dart';
import 'package:product_share_suzuki/features/product/models/category_model.dart';
import 'package:product_share_suzuki/utils/popups/loader.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final imageUploading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories= <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    fetchCategories();
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


// Deklarasi variabel untuk menyimpan data input dari pengguna
  var categoryNameController = TextEditingController();
  var categoryParentIdController = TextEditingController();
  var isCategoryFeatured = false.obs;

  // Instance Firestore dan Storage
  // final FirebaseFirestore firestore = FirebaseFirestore.instance;
  // final FirebaseStorage storage = FirebaseStorage.instance;

  // Instance Image Picker
  final ImagePicker _picker = ImagePicker();
  var pickedImage = Rxn<File>();

   // Metode untuk memilih gambar
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }

  // Metode untuk mengunggah gambar dan menyimpan kategori
   void saveCategory() async {
    if (pickedImage.value == null) {
      Get.snackbar('Error', 'No image selected');
      return;
    }

    try {
      final category = CategoryModel(
        id: '',
        name: categoryNameController.text,
        image: '',
        parentId: categoryParentIdController.text,
        isFeatured: isCategoryFeatured.value,
      );

      await _categoryRepository.addCategory(category, pickedImage.value!);

      Get.snackbar('Success', 'Category saved successfully!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to save category: $e');
    }
  }
  // Load selected category data

  // Get category or Sub-Category Products
}