import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

class orderprogress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Progress'),
      ),

      body: Column(
        children: [
          Center(
            child:SizedBox(
              width: 300,
              height: 260,
              child: AnimatedRadialGauge(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOut,
          
                value: 75,
          
                axis: GaugeAxis(
                  min: 0,
                  max: 100,
          
                  sweepDegrees: 240,
          
                  style: GaugeAxisStyle(
                    background: Colors.grey[300],
                    thickness: 18,
                    cornerRadius: const Radius.circular(10),
                  ),
          
                  progressBar: const GaugeProgressBar.basic(
                    placement: GaugeProgressPlacement.inside,
                    color: Colors.deepPurple,
                  ),
                ),
          
                builder: (context, _, value) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${value.toStringAsFixed(0)}%',
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
          
                        const Text(
                          'ORDER PROGRESS',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: 350,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.deepPurple[400],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.check_circle_outline , color: Colors.green , size: 50,  ),
                Text("Order Placed" , style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold), )
              ],
            ),

          ),

          Container(
            margin: EdgeInsets.only(top: 10),
            width: 350,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.deepPurple[400],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.check_circle_outline , color: Colors.green , size: 50,  ),
                Text("Restaurant Preparing" , style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold), )
              ],
            ),

          ),

          Container(
            margin: EdgeInsets.only(top: 10),
            width: 350,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.deepPurple[400],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.circle , color: Colors.grey , size: 50,  ),
                Text("Out for Delivery" , style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold), )
              ],
            ),

          ),

          Container(
            margin: EdgeInsets.only(top: 10),
            width: 350,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.deepPurple[400],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.circle , color: Colors.grey , size: 50,  ),
                Text("Delivered" , style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold), )
              ],
            ),

          ),
        ],
      ),
      
      );
  }
}