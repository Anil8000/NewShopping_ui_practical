import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shopping_ui_practical/model%20class/ProductDetailsResponse.dart';

class DashboardController extends GetxController{
  dynamic productDetailsResponse;
  bool isDataLoading = true;

  Future<dynamic> productDetailsApi() async {
    http.Response response = await  http.get(Uri.parse("https://fakestoreapi.com/products"));


    if(response.statusCode == 200){
      if(response.body != null){
        productDetailsResponse  = json.decode(response.body);
        print("RES  ::  ${productDetailsResponse[0]["title"]}");
        return productDetailsResponse;
      }
    }
  }


  void updateIsDataLoading(bool isLoading){
    this.isDataLoading = isLoading;
    update();
  }


}