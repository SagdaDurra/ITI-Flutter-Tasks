import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_flutter/Core/AppColors/maincolors.dart';
import 'package:iti_flutter/Core/Images/images_path.dart';
import 'package:iti_flutter/Presentation/Screens/LoginScreen.dart';

class Profilescreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile' , style: TextStyle(color: Colors.black , fontSize: 40 , fontWeight: FontWeight.bold), ),
      ),

      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children : [

          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left:40),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[400],
                    borderRadius: BorderRadius.circular(100),
                ),
                // for formatting the image exactly bc the container doesnt
                // affect the photo
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(ImagesPath.profile)),
              ),
            ],
          ),
          Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text('Name' , style: TextStyle(color: Colors.black , fontSize: 25 , fontWeight: FontWeight.bold), ),
                ),
                SizedBox(height: 10) ,
                Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Mohamed Ali' , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold), ),
                  ),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text('Email' , style: TextStyle(color: Colors.black , fontSize: 25 , fontWeight: FontWeight.bold), ),
                ),
                SizedBox(height: 10) ,
                Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("james.moore.wayne@example-pet-store.com" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold), ),
                  ),
                ),
        ],
            ),

            Container(
              margin: EdgeInsets.all( 20),
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                //color: Colors.red,
                color: Maincolors.logout ,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Loginscreen()));
              }, child: Text('Log out' , style: TextStyle(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.bold), )),
            ),
          ],
        ),
        ],
      ),
    );
  }

}