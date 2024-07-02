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

  final categoryRepository = Get.put(CategoryRepository());
 
  final _imagePicker = ImagePicker();
  RxString _imageUrl = ''.obs;
  String get imageUrl => _imageUrl.value;


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

  final RxString _name = ''.obs;
  final RxString _parentId = ''.obs;
  final RxBool _isFeatured = false.obs;
  final Rx<XFile?> _imageFile = Rxn<XFile>();

  String get name => _name.value;
  set name(String value) => _name.value = value;

  String get parentId => _parentId.value;
  set parentId(String value) => _parentId.value = value;

  bool get isFeatured => _isFeatured.value;
  set isFeatured(bool value) => _isFeatured.value = value;

  XFile? get imageFile => _imageFile.value;
  set imageFile(XFile? value) => _imageFile.value = value;

 Future<void> uploadCategoriesImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        imageFile = image;
        final imageUrl = await categoryRepository.uploadImage(image);
        final category = CategoryModel(
          id: '',
          name: name,
          image: imageUrl,
          parentId: parentId,
          isFeatured: isFeatured,
        );
        await categoryRepository.createCategory(category);
      }
    } catch (e) {
      // handle errors
    }
  }


  Future<void> uploadCategories() async {
    try {
      final image = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imageUploading.value = true;
        final imageUrl = await _categoryRepository.uploadImage(image);
        _imageUrl.value = imageUrl;
        // Update user image record
        Map<String, dynamic> json = {'Categories': imageUrl};
        await _categoryRepository.updateCategoryImage(json);
        Get.snackbar('Congratulations', 'Upload Categories Success');
      }
    } catch (e) {
      Get.snackbar('Oh Snap!', e.toString());
    } finally {
      imageUploading.value = false;
    }
  }

// Future<void> pickImage() async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? image = await _picker.pickImage(source: ImageSource.camera);
//     if (image != null) {
//       _imageFile.value = File(image.path);
//     }
//   }

  // Load selected category data

  // Get category or Sub-Category Products
}