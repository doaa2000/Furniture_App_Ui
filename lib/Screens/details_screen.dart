import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/product_model.dart';


class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      appBar: AppBar(
        backgroundColor:backroundColor,
        elevation: 0.0,
        foregroundColor: Colors.black
      ),

      body: Column(
        children: [
          Stack(
            children: [
Container(
  
              height: 550,
              decoration: BoxDecoration(
                color:backroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),

            Positioned(
              left: 50,
 top: 20,
              child: Container(
               
            height: 225,
            width: 250,
                decoration: BoxDecoration(
                  
                  color:Colors.white,
                  shape: BoxShape.circle),
              ),
            ),
Hero(
  tag:'${product.id}',
  child:   Container(
  alignment: Alignment.center,
    decoration: BoxDecoration(
     
    ),
    child: Image.asset('${product.image}', fit: BoxFit.cover,height: 250,width: 250),
  ),
),
       Positioned(
        bottom: 250,
        left: 110,
         child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Container(
              height: 24,
              width: 24,
         decoration: BoxDecoration(
           shape: BoxShape.circle,
           border: Border.all(
             color:  Color.fromARGB(255, 121, 121, 121),
           ),
         ),
         child: Padding(
           padding: const EdgeInsets.all(2.0),
           child: Container(
             height: 10,
                width: 10,
             decoration: BoxDecoration(
              shape: BoxShape.circle,
        color: Color.fromARGB(255, 99, 97, 97) )),
         ),
       ),
SizedBox(
  width: 30.0,
),
     Container(
             height: 20,
                width: 20,
             decoration: BoxDecoration(
              shape: BoxShape.circle,
        color:defaultColor, 
        ),
         
       ),
       SizedBox(
  width: 30.0,
),
       Container(
             height: 20,
                width: 20,
             decoration: BoxDecoration(
              shape: BoxShape.circle,
        color: Color.fromARGB(255, 223, 83, 141) 
        ),
         
       ),
           ],
         ),
       ),
       SizedBox(height: 400,),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 350,),
            Text('${product.title}',style: TextStyle(fontWeight: FontWeight.bold),),
             SizedBox(height: 10,),
            Text('${product.price} \$',style:TextStyle(color: defaultColor)),
            SizedBox(height: 10,),
              Text('${product.describtion}'),

          ],
         ),
       ),
            ],
            
          ),
  SizedBox(height: 10,),
 Padding(
   padding: const EdgeInsets.all(8.0),
   child: Container(
    height: 40,
    width: double.infinity,
     child: MaterialButton(onPressed: (){},
     child: Row(
       children: [
        Icon(Icons.chat_bubble,color: Colors.white,),
        SizedBox(width: 10,),
         Text('Chat',style: TextStyle(color: Colors.white),),

         Spacer(),
         Icon(Icons.notifications,color: Colors.white,),
           SizedBox(width: 10,),
          Text('Add to cart',style: TextStyle(color: Colors.white),),
       ],
     ),
     color: Colors.amber,
     
     shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))

     ),
   ),
 ),
        ],
      ),
    );
  }
}