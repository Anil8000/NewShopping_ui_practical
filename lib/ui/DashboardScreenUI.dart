import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shopping_ui_practical/controller/DashboardController.dart';
import 'package:shopping_ui_practical/ui/ProductScreenUI.dart';
import 'package:shopping_ui_practical/utils/AppString.dart';

import 'JewelleryScreenUI.dart';


class DashboardScreenUI extends StatefulWidget {
  const DashboardScreenUI({Key? key}) : super(key: key);

  @override
  _DashboardScreenUIState createState() => _DashboardScreenUIState();
}

class _DashboardScreenUIState extends State<DashboardScreenUI> {


  DashboardController dashboardController = Get.put(DashboardController());

  List<String> images = [
    AppString.imagePath + "ic_tshirt1.jpg",
    AppString.imagePath + "ic_tshirt1.jpg",
    AppString.imagePath + "ic_tshirt1.jpg",
    AppString.imagePath + "ic_tshirt1.jpg",
    AppString.imagePath + "ic_tshirt1.jpg",
    AppString.imagePath + "ic_tshirt1.jpg",
    AppString.imagePath + "ic_tshirt1.jpg",
    AppString.imagePath + "ic_tshirt1.jpg",
    AppString.imagePath + "ic_tshirt1.jpg",
    AppString.imagePath + "ic_tshirt1.jpg",
    AppString.imagePath + "ic_tshirt1.jpg",
    AppString.imagePath + "ic_tshirt1.jpg",
    AppString.imagePath + "ic_tshirt1.jpg",
    AppString.imagePath + "ic_tshirt1.jpg",
    AppString.imagePath + "ic_tshirt1.jpg",
    AppString.imagePath + "ic_tshirt1.jpg",
  ];



  @override
  void initState() {
    super.initState();
    dashboardController.updateIsDataLoading(true);
    productDetailsApi();

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:

          GetBuilder(
            init: DashboardController(),
            builder: (DashboardController controller) {
              return
                controller.isDataLoading
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                children: [
                  Row(
                    children: [

                      Expanded(
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text("Welcome User",style: TextStyle(color: Colors.white,fontSize:20,fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                    ],
                  ),


                  SizedBox(height: 15,),

                  CarouselSlider(
                    items: [
                      Image.asset(AppString.imagePath+"ic_shopping1.jpg",fit: BoxFit.fitWidth,),
                      Image.asset(AppString.imagePath+"ic_shopping2.jpg",fit: BoxFit.fitWidth,),
                      Image.asset(AppString.imagePath+"ic_shopping4.jpg",fit: BoxFit.fitWidth,),
                    ],
                    options: CarouselOptions(
                      autoPlay: false,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      aspectRatio: 2.0,
                      initialPage: 2,
                    ),
                  ),



                  Container(
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [


                          categoryContainer(
                            title: "jewellery",
                            img: "ic_jewels_img.jpg",
                            onTap: () {
                              Get.to(()=>  JewelleryScreenUI());
                            },
                          ),

                          SizedBox(width: 5,),


                          categoryContainer(
                              title: "T-shirts",
                              img:  "ic_tshirt1.jpg",
                            onTap: () {

                            },
                          ),


                          SizedBox(width: 5,),


                          categoryContainer(
                            title: "Mobiles",
                            img:  "ic_mobile.jpg",
                            onTap: () {

                            },
                          ),

                          SizedBox(width: 5,),

                          categoryContainer(
                            title: "jewellery",
                            img: "ic_jewels_img.jpg",
                            onTap: () {

                            },
                          ),

                          SizedBox(width: 5,),


                          categoryContainer(
                            title: "T-shirts",
                            img:  "ic_tshirt1.jpg",
                            onTap: () {

                            },
                          ),


                          SizedBox(width: 5,),


                          categoryContainer(
                            title: "Mobiles",
                            img:  "ic_mobile.jpg",
                            onTap: () {

                            },
                          ),





                        ],
                      ),
                    ),
                  ),



                  Expanded(
                    child: GridView.builder(
                      itemCount: controller.productDetailsResponse.length,

                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 1.0,
                          childAspectRatio: 9/15
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () {
                                  Get.to(()=>
                                      ProductScreenUI(
                                        img: controller.productDetailsResponse[index]["image"].toString(),
                                        title: controller.productDetailsResponse[index]["title"].toString(),
                                        category: controller.productDetailsResponse[index]["category"].toString(),
                                        description: controller.productDetailsResponse[index]["description"].toString(),
                                        price: controller.productDetailsResponse[index]["price"].toString(),
                                        id: controller.productDetailsResponse[index]["id"].toString(),
                                        rating: controller.productDetailsResponse[index]["rating"]["rate"].toString(),
                                        count: controller.productDetailsResponse[index]["rating"]["count"].toString(),
                                      )
                                  );
                                },
                                child: Card(
                                  elevation: 8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.network(controller.productDetailsResponse[index]["image"],height: 200,),

                                      SizedBox(height: 5,),

                                      Container(
                                        color: Colors.purple,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30,
                                                child: Text(controller.productDetailsResponse[index]["title"],
                                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 17),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("\$"+controller.productDetailsResponse[index]["price"].toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                                                  Text(controller.productDetailsResponse[index]["rating"]["rate"].toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                )
                            ),
                          ),
                        );
                      },
                    ),
                  ),


                ],
              );
            },
          ),
        ),
      ),
    );
  }


  productDetailsApi() async {

    dashboardController.productDetailsApi().then((value) {
      if(value != null){
        dashboardController.productDetailsResponse = value;
        dashboardController.updateIsDataLoading(false);
      }
      else{
        Fluttertoast.showToast(msg: "Something went wrong");
        dashboardController.updateIsDataLoading(false);
      }

    });

  }


  Widget categoryContainer({required String img,required String title,GestureTapCallback? onTap,}){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(AppString.imagePath+img),

              ),
              SizedBox(height: 3,),
              Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
            ],
          ),
        ),
      ),
    );
  }

}
