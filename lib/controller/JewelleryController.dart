import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class JewelleryController extends GetxController{
  dynamic JewelleryDetailsResponse;
  bool isDataLoading = true;

  Future<dynamic> JewelleryDetailsApi() async {
    http.Response response = await  http.get(Uri.parse("https://fakestoreapi.com/products/category/jewelery"));


    if(response.statusCode == 200){
      if(response.body != null){
        JewelleryDetailsResponse  = json.decode(response.body);
        print("RES  ::  ${JewelleryDetailsResponse[0]["title"]}");
        return JewelleryDetailsResponse;
      }
    }
  }


  void updateIsDataLoading(bool isLoading){
    this.isDataLoading = isLoading;
    update();
  }


}