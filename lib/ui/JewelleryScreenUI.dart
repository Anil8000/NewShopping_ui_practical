import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shopping_ui_practical/controller/JewelleryController.dart';

class JewelleryScreenUI extends StatefulWidget {
  const JewelleryScreenUI({Key? key}) : super(key: key);

  @override
  _JewelleryScreenUIState createState() => _JewelleryScreenUIState();
}

class _JewelleryScreenUIState extends State<JewelleryScreenUI> {
  JewelleryController jewelleryController = Get.put(JewelleryController());


  @override
  void initState() {
    super.initState();
    jewelleryController.updateIsDataLoading(true);
    getJewelleryDetails();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder(
          init: JewelleryController(),
          builder: (JewelleryController controller) {
            return
              controller.isDataLoading
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
              itemCount: controller.JewelleryDetailsResponse.length,

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

                        },
                        child: Card(
                          elevation: 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(controller.JewelleryDetailsResponse[index]["image"],height: 200,),

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
                                        child: Text(controller.JewelleryDetailsResponse[index]["title"],
                                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 17),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("\$"+controller.JewelleryDetailsResponse[index]["price"].toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                                          Text(controller.JewelleryDetailsResponse[index]["rating"]["rate"].toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
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
            );
          },
        ),
      ),
    );
  }




  getJewelleryDetails(){

    jewelleryController.updateIsDataLoading(true);
    jewelleryController.JewelleryDetailsApi().then((value) {
      if(value != null){
        jewelleryController.JewelleryDetailsResponse = value;
        jewelleryController.updateIsDataLoading(false);
      }
      else{
        Fluttertoast.showToast(msg: "Something went wrong");
        jewelleryController.updateIsDataLoading(false);
      }

    });

  }







}
