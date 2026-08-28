import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_flutter/Presentation/Screens/Payment/paymentDone.dart';

class Paymentscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Payments' , style: TextStyle(color: Colors.black , fontSize: 40 , fontWeight: FontWeight.bold), ),
     ),

     body: Column(
       children: [
         Center(
           child:Container(
             margin: EdgeInsets.all(10),
             width: 500,
             height: 500,
             padding: EdgeInsets.all(20),
             decoration: BoxDecoration(
               color: Colors.deepPurple[400],
               borderRadius: BorderRadius.circular(20),
             ),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                  Text("Card Number",  style: TextStyle(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.bold), ),
                 Container(
                   height: 70,
                   width: 350,
                   decoration: BoxDecoration(
                     color: Colors.deepPurple[200],
                     borderRadius: BorderRadius.circular(20),
                   ),
                 ),
                 //SizedBox(height: 100) ,
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [

                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Expiry Date",  style: TextStyle(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.bold), ),
                         SizedBox(height: 8),
                         Container(
                           margin: EdgeInsets.only(left: 10),
                           height: 60,
                           width: 160,
                           decoration: BoxDecoration(
                             color: Colors.deepPurple[200],
                             borderRadius: BorderRadius.circular(20),
                           ),
                         ),
                       ],
                     ),


                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("CVV",  style: TextStyle(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.bold), ),
                         Container(
                           margin: EdgeInsets.only(left: 10),
                           height: 60,
                           width: 160,
                           decoration: BoxDecoration(
                             color: Colors.deepPurple[200],
                             borderRadius: BorderRadius.circular(20),
                           ),
                         ),
                       ],
                     ),

                   ],
                 ),

                 //SizedBox(height: 10) ,

                  Text("Name on Card",  style: TextStyle(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.bold), ),
                 Container(
                   margin:EdgeInsets.only(left:10),
                   height: 70,
                   width: 350,
                   decoration: BoxDecoration(
                     color: Colors.deepPurple[200],
                     borderRadius: BorderRadius.circular(20),
                   ),
                 ),

               ],
             ),
           ),
         ),
         SizedBox(height: 10) ,
         Center(
           child: Container(
             height: 50,
             width: 150,
             decoration: BoxDecoration(
               color: Colors.deepPurple,
               borderRadius: BorderRadius.circular(20),
             ),
             child: TextButton(onPressed: (){
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => paymentDone())) ;
             }, child: Text('Pay' , style: TextStyle(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.bold), )),
           ),
         ),
       ],
     ),

   );
  }

}