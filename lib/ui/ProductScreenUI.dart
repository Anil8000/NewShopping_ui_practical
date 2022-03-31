import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreenUI extends StatefulWidget {
  String img;
  String id;
  String title;
  String price;
  String description;
  String rating;
  String category;
  String count;

  ProductScreenUI({Key? key,required this.img,required this.category,required this.count,required this.id,
    required this.title,required this.price,required this.rating,required this.description}) : super(key: key);

  @override
  _ProductScreenUIState createState() => _ProductScreenUIState();
}

class _ProductScreenUIState extends State<ProductScreenUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(

          children: [

            Container(
                height: Get.height/2.5,
                width: Get.width,
                child: Image.network(widget.img,fit: BoxFit.fitHeight,)),


            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: Get.width/1.3,
                  child: Text(widget.title,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22),overflow: TextOverflow.ellipsis,)
              ),
            ),


            Divider(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("\$"+widget.price,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19),),
            ),

            Divider(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.category,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19),),
            ),

            Divider(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.rating+"(Reviews ${ widget.count})",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19),),
            ),


            Divider(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5,)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.description,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),

                      maxLines: 4,
                    ),
                  )
              ),
            ),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    width: Get.width/2.5,
                    child: Center(child: Text("Buy Now",style: TextStyle(fontSize: 19,color: Colors.white,fontWeight: FontWeight.bold),)),
                  ),

                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    width: Get.width/2.5,
                    child: Center(child: Text("Add to Cart",style: TextStyle(fontSize: 19,color: Colors.white,fontWeight: FontWeight.bold),)),
                  ),

                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
