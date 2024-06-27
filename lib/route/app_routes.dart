import 'package:get/get.dart';
import 'package:product_share_suzuki/features/authentication/screens/login/login.dart';
import 'package:product_share_suzuki/features/authentication/screens/onBoarding/onboarding.dart';
import 'package:product_share_suzuki/features/authentication/screens/signup/signup.dart';
import 'package:product_share_suzuki/features/authentication/screens/verifyEmail/verify_email.dart';
import 'package:product_share_suzuki/features/personalization/screens/address/address.dart';
import 'package:product_share_suzuki/features/personalization/screens/profile/profile.dart';
import 'package:product_share_suzuki/features/personalization/screens/settings/settings.dart';
import 'package:product_share_suzuki/features/product/screens/all_product/all_products.dart';
import 'package:product_share_suzuki/features/product/screens/home/home.dart';
import 'package:product_share_suzuki/features/product/screens/product/product.dart';
import 'package:product_share_suzuki/features/product/screens/product_reviews/product_reviews.dart';
import 'package:product_share_suzuki/route/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: GRoutes.home, page: () => const HomeScreen()),
    GetPage(name: GRoutes.product, page: () => const ProductScreen()),
    GetPage(name: GRoutes.leasing, page:() => const HomeScreen()),
    GetPage(name: GRoutes.settings, page: () => const SettingsScreens()),
    GetPage(name: GRoutes.productReviews, page: () => const GProductReviews()),
    GetPage(name: GRoutes.allProducts, page: () => const AllProducts()),
    GetPage(name: GRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: GRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: GRoutes.signUp, page: () => const SignupScreen()),
    GetPage(name: GRoutes.onBoarding, page: () => const OnBoardingScreen()),
    GetPage(name: GRoutes.sigIn, page: () => const LoginScreen()),
    GetPage(name: GRoutes.verifyEmail, page: () => const VerifyEmailScreen())
  ];
}