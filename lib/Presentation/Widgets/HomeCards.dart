import 'package:flutter/material.dart';

class Homecards extends StatelessWidget{

  Widget? childr;
  Widget? child;
  Homecards({this.childr , required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100 ,
        height :100 ,
        decoration: BoxDecoration(
          color: Colors.deepPurple[100] ,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.only(right: 10 , left: 10),

        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // this control the container of pizza icon and pizza text
            children: [
              Container(
                height: 50,
                width: 50,

                decoration: BoxDecoration(
                  color: Colors.deepPurple[400] ,
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle ,
                ),
                child: childr ,
              ),
              child!
            ],
          ),
        )
    ) ;

  }

}

// children(column) : children ----> list cause the children of column is a list of
// widgets , childre(column) : [
// if you want to put list so you should write it all
// ]