import 'package:get/get.dart';
import 'package:product_share_suzuki/data/repositories/banners/banner_repository.dart';
import 'package:product_share_suzuki/features/product/models/banner_model.dart';
import 'package:product_share_suzuki/utils/popups/loader.dart';

class BannerController extends GetxController {
  // static BannerController instance => Get.find();

  // Final variables
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  // Update page navigation dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
  
  // Fetch banners
   Future<void> fetchBanners() async {
    try {

      // Show loader while loading categories
      isLoading.value = true;

      // Fetch banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // Asign banners
      this.banners.assignAll(banners);

    } catch (e){
      Gloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }
}