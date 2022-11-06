import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furniture_app/Screens/details_screen.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/product_model.dart';
import 'package:hexcolor/hexcolor.dart';
var press=(){};
class HomePage extends StatelessWidget {
  List categories = ['All', 'Sofa', 'park bench', 'ArmChair'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      appBar: AppBar(
        backgroundColor: defaultColor,
        elevation: 0.0,
       title: Text('Dashboard'),
       actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.notifications),
        ),
       ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              height: 30.0,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  
                  itemBuilder: (context, index) => Container(
                    
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color:selectedIndex==index? Colors.white.withOpacity(0.4):Colors.transparent,
                        ),
                        child: Text(
                          categories[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                  separatorBuilder: (context, index) => Container(
                        width: 1.0,
                      ),
                  itemCount: categories.length),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Stack(
              children: [
Container(
  margin: EdgeInsets.only(top: 70),
                decoration: BoxDecoration(
                  
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    color: Colors.white),
                    
              ),

ListView.separated(
  physics: BouncingScrollPhysics(),
  itemBuilder: (context,index)=>buildCatItem(products[index],context,index),
   separatorBuilder: (context,index)=>Container(width: 1.0),
    itemCount: products.length
    
    ),
              ],

              
            ),
          ),

          
        ],
      ),
    );
  }
}



//buildproductItem



Widget buildCatItem(Product model,context, index)=>InkWell(
  onTap: (){

    Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailsScreen(
      product: products[index],
    )) ) ; },
  child:   Stack(
    children: [
      Padding(
    padding: const EdgeInsets.all(35.0),
    child:   Container(
    
      padding: EdgeInsets.only(right: 20,left: 20),
      height: 120,
      decoration: BoxDecoration(
  
        boxShadow: [BoxShadow(blurRadius: 10.0,color: Colors.grey)],
  
        color:model.color,
        borderRadius: BorderRadius.circular(20)
    
      ),
      
    ),
  
  
  
  ),
  Padding(
    padding: const EdgeInsets.all(35.0),
    child:   Container(
      
      margin: EdgeInsets.only(right: 10),
      
    //  padding: EdgeInsets.only(right: 20,left: 20),
      height: 120,
      decoration: BoxDecoration(
  
        color:Colors.white,
        borderRadius: BorderRadius.circular(20)
    
      ),
    ),
  
  
  
  ),
  Positioned(
    left: 150,
    child:Hero(
      tag: '${model.id}',
      child: Container(
        
       height: 160,
       width:200,
       child: Image.asset('${model.image}',),
      ),
    )
    ,
    
    ),
  
    Positioned(
      top: 115,
      left: 35,
      
      child: Container(
      height: 40,
      width: 80,
      alignment: Alignment.center,
    child: Text('${model.price} \$'),
   decoration: BoxDecoration(
    color: Colors.amber,
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(40),
  bottomLeft: Radius.circular(20),
    ),
   ),
    )),
    Positioned(
      bottom: 100,
      left: 37,
      child: Text('${model.title}',style: TextStyle(fontSize: 11),)),
  
   
    ],
  ),
);