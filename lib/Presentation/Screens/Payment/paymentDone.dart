import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class paymentDone extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Done' , style: TextStyle(color: Colors.black , fontSize: 40 , fontWeight: FontWeight.bold), ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.check_circle , color: Colors.green , size: 100,  ),
          Center(
            child: Text('Payment Done Successfully' , style: TextStyle(color: Colors.black , fontSize: 25 , fontWeight: FontWeight.bold), ),
          ),
        ],
      ),
    );
  }

}