import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logincards extends StatelessWidget {
  Widget ? child ;
  Logincards({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 100,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.deepPurple[200],
          borderRadius: BorderRadius.circular(20),
        ),
          child: child, // must use it in class again not only passing
        );
  }

}