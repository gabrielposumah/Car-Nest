import 'package:product_share_suzuki/features/product/models/banner_model.dart';
import 'package:product_share_suzuki/features/product/models/brand_model.dart';
import 'package:product_share_suzuki/features/product/models/category_model.dart';
import 'package:product_share_suzuki/features/product/models/product_attribute_model.dart';
import 'package:product_share_suzuki/features/product/models/product_model.dart';
import 'package:product_share_suzuki/features/product/models/product_variation_model.dart';
import 'package:product_share_suzuki/route/routes.dart';

class GDummyData {
  // Banners
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: 'assets/images/apv.png', targetScreen: GRoutes.compare, active: false),
    BannerModel(imageUrl: 'assets/images/promo.png', targetScreen: GRoutes.cart, active: false),
    BannerModel(imageUrl: 'assets/images/promo.png', targetScreen: GRoutes.leasing, active: true),
    BannerModel(imageUrl: 'assets/images/promo.png', targetScreen: GRoutes.search, active: true),
    BannerModel(imageUrl: 'assets/images/promo.png', targetScreen: GRoutes.settings, active: false),
    BannerModel(imageUrl: 'assets/images/promo.png', targetScreen: GRoutes.userAddress, active: false),
    BannerModel(imageUrl: 'assets/images/promo.png', targetScreen: GRoutes.comparing, active: true),
  ];

  // /// User
  // static final UserModel user = UserModel(id: id, firstName: 'Gabriel', lastName: 'Posumah', 
  // email: 'jgposumah@gmail.com', phoneNumber: '0822921039120', profilePicture: 'assets/images/profile.png',
  // addresses :[
  //   AddressModel(
  //     id: '1',
  //     name: 'Gabriel',
  //     phoneNumber: '+622382193812',
  //   )
  // ]);

  // /// cart
  // static final CartModel cart = CartModel(

  // );

  // // Products


  // List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Type', image: 'assets/images/type_car.png', isFeatured: true),
    CategoryModel(id: '2', name: 'Passenger', image: 'assets/images/passenger.png', isFeatured: true),
    CategoryModel(id: '3', name: 'Commercial', image: 'assets/images/commercial.png', isFeatured: true),
    
    // Subcategories
    CategoryModel(id: '4', name: '2 Row', image: 'assets/images/2_row.png', parentId: '2', isFeatured: true),
    CategoryModel(id: '5', name: '3 Row', image: 'assets/images/3_row.png', parentId: '2', isFeatured: true),
    CategoryModel(id: '6', name: 'FD', image: 'assets/images/2_row.png', parentId: '3', isFeatured: true),
    CategoryModel(id: '7', name: 'WD', image: 'assets/images/3_row.png', parentId: '3',isFeatured: true),
  ];

  // List of all products
  static final List<ProductModel> products = [
    ProductModel(id: '001', stock: 15, price: 135, title: 'Grand Vitara', thumbnail: 'assets/images/xl7.png',
    salePrice: 120, brand: BrandModel(id: '1', image: 'assets/images/suzuki.png',name: 'Suzuki',isFeatured: true, productsCount: 10), categoryId: '1', description: 'Grand Vitara AT', sku: 'GT45656',
    images: ['assets/images/xl7.png', 'assets/images/xl7.png', 'assets/images/xl7.png', 'assets/images/xl7.png'], 
    productAttributes: [
      ProductAttributeModel(name: 'Color', values : ['Green', 'Black', 'Red']),
      ProductAttributeModel(name: 'Size', values: ['Small', 'Medium', 'Large']),
    ],
    productVariations: [
      ProductVariationModel(id: '1',
      stock: 34,
      price: 134,
      salePrice: 122,
      image: 'assets/images/xl7.png',
      description: 'This is a car passengers',
       attributeValues: {'Color': 'Green', 'Type' : 'AT'}),
      ProductVariationModel(id: '2', 
      stock: 24,
      price: 134,
      salePrice: 122,
      image: 'assets/images/xl7.png',
      description: 'This is a car passengers',
      attributeValues: {'Color': 'Red', 'Type' : 'AT'}),
      ProductVariationModel(id: '3',
      stock: 24,
      price: 134,
      salePrice: 122,
      image: 'assets/images/xl7.png',
      description: 'This is a car passengers',
      attributeValues: {'Color': 'Black', 'Type' : 'AT'}),
    
    ], productType : 'ProductType.value'),
  ];
}