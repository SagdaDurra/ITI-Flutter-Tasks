import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Popularchefsdetails extends StatefulWidget {
  @override
  State<Popularchefsdetails> createState() => _PopularchefsdetailsState();
}

class _PopularchefsdetailsState extends State<Popularchefsdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Chefs Details' , style: TextStyle(color: Colors.black , fontSize: 40 , fontWeight: FontWeight.bold), ),
      ),

      body:Container(
        margin: EdgeInsets.all(10),
        width: 500,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.deepPurple[200],
          borderRadius: BorderRadius.circular(20),
        ),

      ),
    );
  }

}
