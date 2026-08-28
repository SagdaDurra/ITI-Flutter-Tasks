import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_flutter/Data/Requests/Popular_Chefs_Request.dart';
import 'package:iti_flutter/Presentation/Screens/Authentication/RegisterScreen.dart';
import 'package:iti_flutter/Presentation/Screens/Home/HomeScreen.dart';
import 'package:iti_flutter/Presentation/Widgets/LoginCards.dart';

// current state makes you go to form state that has the methods (validate()
// reset()
// save())

// key points to current state that gives the state of the form that key points at and when going to form state
// we have the 3 functions here (validate() , reset() , save()) so we can validate the form || reset it || save it

class Loginscreen extends StatefulWidget {
  final String name;
  const Loginscreen({
    super.key,
    this.name = "",
  });
  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  GlobalKey<FormState>  formkey = GlobalKey<FormState>() ;
  bool isVisible =false ;

  // i put here not in the home bc this is the first screen that the user sees
  // i mean that i put it in main to be like this
  // if didnt call the get popular chefs in the init state
  // the print wont work and wont test it
 //@override
 //void initState() {
 //  super.initState();
 //  PopularChefsRequest.getPopularChefs();
 //}

 //void getChefs() async {
 //  popularChefsModel =
 //  await PopularChefsRequest.getPopularChefs();

 //  setState(() {});
 //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login' , style: TextStyle(color: Colors.black , fontSize: 40 , fontWeight: FontWeight.bold), ),
      ),
      // Singlechildscrollview ---> so that the keyboard doesnt make overflow
      body: Center(
        child: SingleChildScrollView(
          // after trying making the form in the login cards and didnt ruun :)
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Email' , style: TextStyle(color: Colors.black , fontSize: 25 , fontWeight: FontWeight.bold ,) , ),
                ),

                  Logincards(hintText: "Examplename@example",
                  prefix : Icon(Icons.email , color: Colors.grey , size: 30,  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (input){
                    if(!input!.contains("@")){
                      return "invalid email";
                    }
                    else if(input==""){
                      return "Email is required";
                    }
                    else{
                      return null;
                    }
                  },
                  secure: false, // bc if i didnt write it , it will make null and i said to it in login cards
                  // that i swear it wont be null = (secure!)

                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Password' , style: TextStyle(color: Colors.black , fontSize: 25 , fontWeight: FontWeight.bold), ),
                ),
                Logincards(hintText: "********" ,
                    prefix : Icon(Icons.password , color: Colors.grey , size: 30,  ) ,
                    suffix : IconButton( onPressed: (){
                      setState(() {
                        isVisible = !isVisible;
                      });

                  }, icon:isVisible?Icon(Icons.visibility): Icon(Icons.visibility_off),
                    ) ,
                    keyboardType: TextInputType.visiblePassword,
                      validator: (input) {
                        if (input == "") {
                          return "invalid password";
                        }
                        else if (input!.length < 8) {
                          return "password must be 8 characters at least";
                        }
                        else {
                          return null;
                        }
                },
                  secure: !isVisible, // when unvisible
                    ),

                SizedBox(height: 15) ,

                Center(
                  child:Column(
                    children: [
                      MaterialButton(
                        color: Colors.deepPurple,
                        height: 50,
                        minWidth: 150,
                        // for border radius we use shape
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('Don\'t have an account?\n             Register' ,
                          // 'Don\'t have an account?\n
                          // 'Register' == the structure i made above
                          style: TextStyle(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.bold), ),
                        onPressed: (){
                          Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) => Registerscreen()),(route) => false,);
                        },
                      ),
                      SizedBox(height: 20) ,
                      MaterialButton(
                        color: Colors.deepPurple,
                        height: 50,
                        minWidth: 150,
                        // for border radius we use shape
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("Login" ,
                          style: TextStyle(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.bold), ),
                        onPressed: (){
                             if(formkey.currentState!.validate()) {
                             Navigator.pushAndRemoveUntil(context,
                         MaterialPageRoute(builder: (context) => MyHomePage(title: "done" , name: widget.name,)), (
                              route) => false,);
                                  }
                        },
                      ),

                    ],
                  ),
                  //child: Container(
                  //  height: 50,
                  //  width: 150,
                  //  decoration: BoxDecoration(
                  //    color: Colors.deepPurple,
                  //    borderRadius: BorderRadius.circular(20),
                  //  ),
                  //  child: Row(
                  //    children: [
                  //      Center(child: Padding(
                  //        padding: const EdgeInsets.all(8.0),
                  //        child: Text('Login' , style: TextStyle(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.bold), ),
                  //      )),
                  //      SizedBox(width: 10) ,
                  //      IconButton(onPressed: (){
                  //        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "done")), (route) => false,);
                  //      }, icon: Icon(Icons.login , color: Colors.white , size: 30,  ),)
                  //    ],
                  //  ),
            //
                  //),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}