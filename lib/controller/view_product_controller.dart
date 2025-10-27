import 'package:e_commerce_project/Data/model/product_view_model.dart';
import 'package:e_commerce_project/Data/service/api_clint.dart';
import 'package:e_commerce_project/Data/service/api_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../Data/service/api_checker.dart';

class ViewProductController extends GetxController{
  RxList<ProductViewModel> products = RxList();
  RxBool isLoading = RxBool(false);
  
  Future<void> getProducts() async {
    isLoading(true);
    final response = await ApiClient.getData(ApiConstant.getProduct);

    if(response.statusCode == 200){
      if (kDebugMode) {
        print(response.body);
      }


      final data = response.body['data'];

      products.clear();
      for(var i in data){
        products.add(ProductViewModel.fromJson(i));
      }
      print(products  );
    }else {
      ApiChecker.checkApi(response);
    }
    
    isLoading(false);
  }
}