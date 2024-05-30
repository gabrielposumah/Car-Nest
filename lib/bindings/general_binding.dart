import 'package:get/get.dart';
import 'package:product_share_suzuki/utils/networks/network_manager.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
