import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_flutter/Presentation/Screens/HomeScreen.dart';
import 'package:iti_flutter/Presentation/Widgets/LoginCards.dart';

class Loginscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login' , style: TextStyle(color: Colors.black , fontSize: 40 , fontWeight: FontWeight.bold), ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Email' , style: TextStyle(color: Colors.black , fontSize: 25 , fontWeight: FontWeight.bold ,) , ),
            ),
            Logincards(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Password' , style: TextStyle(color: Colors.black , fontSize: 25 , fontWeight: FontWeight.bold), ),
            ),
            Logincards(),

            SizedBox(height: 15) ,

            Center(
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Login' , style: TextStyle(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.bold), ),
                    )),
                    SizedBox(width: 10) ,
                    IconButton(onPressed: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "done")), (route) => false,);
                    }, icon: Icon(Icons.login , color: Colors.white , size: 30,  ),)
                  ],
                ),

              ),
            ),
          ],
        ),
      )
    );
  }

}