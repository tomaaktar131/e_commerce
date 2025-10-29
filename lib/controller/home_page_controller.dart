import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Data/model/brand_view_model.dart';
import '../Data/model/product_model.dart';
import '../Data/service/api_checker.dart';
import '../Data/service/api_clint.dart';
import '../Data/service/api_constant.dart';

class HomePageController extends GetxController {
  var isLoading = false.obs;

  ///<========= Product Details page ==============> ///

  RxInt selectedIndex = 0.obs;


  Rx<int> selectedSizeIndex = (-1).obs;
  RxString selectedSize = ''.obs;

  void selectSize(int index, ProductData product) {
    selectedSizeIndex.value = index;
    selectedSize.value = product.sizes![index];
    print("Selected Size: ${selectedSize.value}");
  }

  RxMap<String, dynamic> selectedProduct = <String, dynamic>{}.obs;
  setSelectedProduct(Map<String, dynamic> product) {
    selectedProduct.value = product;
  }

  RxBool isExpanded = false.obs;

  ///<===============home page=================>///
  RxList<ProductData> favouriteProducts = RxList<ProductData>();

  RxBool isClicked = false.obs;
  final searchController = TextEditingController();

  void toggleFavourite(product) {
    if (favouriteProducts.contains(product)) {
      favouriteProducts.remove(product);
    } else {
      favouriteProducts.add(product);
    }
  }

  //<============== get all product ========>

  RxList<ProductData> products = RxList<ProductData>();
  Future<void> fetchProductData() async {
    isLoading(true);

    final response = await ApiClient.getData(ApiConstant.productDataEndPoint);
    if (response.statusCode == 200) {
      List<dynamic> data = response.body['data'];
      products.value = data.map((e) => ProductData.fromJson(e)).toList();
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);
  }
  //<============== get all brands ========>

  RxList<BrandViewModel> brands = RxList<BrandViewModel>();
  Future<void> fetchBrandsData() async {
    isLoading(true);

    final response = await ApiClient.getData(ApiConstant.brandDataEndPoint);
    if (response.statusCode == 200) {
      List<dynamic> data = response.body['data'];
      brands.value = data.map((e) => BrandViewModel.fromJson(e)).toList();
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);}

    ///<================review page =================>///
    final RxList<Map<String, dynamic>> reviews = <Map<String, dynamic>>[
      {
        "name": "Jenny Wilson",
        "date": "13 Sep, 2020",
        "rating": 5,
        "review":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...",
        "image": "assets/images/person_1.png",
      },
      {
        "name": "Jenny Wilson",
        "date": "13 Sep, 2020",
        "rating": 3.5,
        "review":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...",
        "image": "assets/images/person_2.png",
      },
      {
        "name": "Jenny Wilson",
        "date": "13 Sep, 2020",
        "rating": 5,
        "review":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...",
        "image": "assets/images/person_3.png",
      },
      {
        "name": "Jenny Wilson",
        "date": "13 Sep, 2020",
        "rating": 4.8,
        "review":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...",
        "image": "assets/images/person_1.png",
      },
      {
        "name": "Jenny Wilson",
        "date": "13 Sep, 2020",
        "rating": 4.8,
        "review":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...",
        "image": "assets/images/person_2.png",
      },
    ].obs;
    averageRating() {
      if (reviews.isEmpty) {
        return 0.0;
      }
      final sum = reviews
          .map((r) => r['rating'] as num)
          .reduce((a, b) => a + b);
      final average = sum / reviews.length;
      return double.parse(average.toStringAsFixed(1));
    }

    ///<================Add review page =================>///
    final TextEditingController nameController = TextEditingController();
    final TextEditingController experienceController = TextEditingController();
    RxDouble rating = 2.5.obs;

}
