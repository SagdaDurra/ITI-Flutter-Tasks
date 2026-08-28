import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_flutter/Presentation/Screens/Authentication/LoginScreen.dart';


// RegExp checks that the input contains only numbers from 0 to 9,
// so letters, spaces, and symbols are not allowed.
// ^ means start of input, [0-9] means numbers from 0 to 9,
// + means one or more numbers, and $ means end of input.
// hasMatch() returns true if the input follows this pattern.
// We can also allow spaces by adding a space inside the brackets:
// RegExp(r'^[0-9 ]+$')  → allows numbers and spaces.
//RegExp(r'^[0-9]+$').hasMatch(input!)//
// must use two different vars for the eye in the pass
// bc when using the same they will work together

class Registerscreen extends StatefulWidget {

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  GlobalKey<FormState>  formkey = GlobalKey<FormState>() ;
  TextEditingController ? CheckPassController = TextEditingController() ;
  bool issVisible =false ;
  bool isvisible =false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register' , style: TextStyle(color: Colors.black , fontSize: 40 , fontWeight: FontWeight.bold), ),
      ),

      body:SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Name' , style: TextStyle(color: Colors.black , fontSize: 25 , fontWeight: FontWeight.bold), ),
              ),
              Padding(
                padding: const EdgeInsets.only(left :8.0 , right :8.0),
                child: TextFormField(
                  validator: (input){
                    if(input==""){
                      return "Name is required";
                    } else if (RegExp(r'^[0-9]+$').hasMatch(input!)){
                      return "Name must be a Letters";
                    }
                    // if you want only letters
                    else if (RegExp(r'^[a-zA-Z]+$').hasMatch(input!)){
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: ' john doe',
                    hintStyle: TextStyle(color: Colors.grey ,fontSize: 20 , fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                    color: Colors.deepPurple,
                    ) ,
                  ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Age' , style: TextStyle(color: Colors.black , fontSize: 25 , fontWeight: FontWeight.bold), ),
              ),
              Padding(
                padding: const EdgeInsets.only(left :8.0 , right :8.0),
                child: TextFormField(
                  validator: (input){
                    if(input==""){
                      return "Age is required";
                    } else if (RegExp(r'^[a-zA-Z]+$').hasMatch(input!)){
                      return "Age must be a number";
                    }
                    // if you want only nums
                    else if (RegExp(r'^[0-9]+$').hasMatch(input!)){
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: '20',
                    hintStyle: TextStyle(color: Colors.grey ,fontSize: 20 , fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ) ,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Address' , style: TextStyle(color: Colors.black , fontSize: 25 , fontWeight: FontWeight.bold), ),
              ),
              Padding(
                padding: const EdgeInsets.only(left :8.0 , right :8.0),
                child: TextFormField(
                  validator: (input){
                    if(input==""){
                      return "Address is required";
                    }
                    else
                      return null;
                    },
                  decoration: InputDecoration(
                    hintText: 'Cairo , 123 Street',
                    hintStyle: TextStyle(color: Colors.grey ,fontSize: 20 , fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ) ,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Email' , style: TextStyle(color: Colors.black , fontSize: 25 , fontWeight: FontWeight.bold), ),
              ),
              Padding(
                padding: const EdgeInsets.only(left :8.0 , right :8.0),
                child: TextFormField(
                  validator: (input){
                    if(input==""){
                      return "Email is required";
                    }
                    else if(!input!.contains("@"))
                      return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Examplename@example',
                    hintStyle: TextStyle(color: Colors.grey ,fontSize: 20 , fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ) ,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Password' , style: TextStyle(color: Colors.black , fontSize: 25 , fontWeight: FontWeight.bold), ),
              ),
              Padding(
                padding: const EdgeInsets.only(left :8.0 , right :8.0),
                child: TextFormField(
                  controller: CheckPassController ,
                  validator: (input){
                    if(input==""){
                      return "Password is required";
                    }
                    else if(input!.length<8)
                      return null;
                  },
                  obscureText: !issVisible,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          issVisible = !issVisible;
                        });
                      }, icon:issVisible?Icon(Icons.visibility): Icon(Icons.visibility_off),) ,
                    hintStyle: TextStyle(color: Colors.grey ,fontSize: 20 , fontWeight: FontWeight.bold),
                    hintText: '********',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ) ,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Confirm Password' , style: TextStyle(color: Colors.black , fontSize: 25 , fontWeight: FontWeight.bold), ),
              ),
              Padding(
                padding: const EdgeInsets.only(left :8.0 , right :8.0),
                child: TextFormField(
                  validator: (input){
                    if(input==""){
                      return "Confirm Password is required";
                    } else if(input != CheckPassController!.text){
                      return "Password doesn't match";
                    }
                    else if(input == CheckPassController!.text)
                      return null;
                  },
                  obscureText: !isvisible,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          isvisible = !isvisible;
                        });
                      }, icon:isvisible?Icon(Icons.visibility): Icon(Icons.visibility_off),) ,
                    hintText: '********',
                    hintStyle: TextStyle(color: Colors.grey ,fontSize: 20 , fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ) ,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15) ,

              Center(
                child: MaterialButton(

                  color: Colors.deepPurple,
                  height: 50,
                  minWidth: 150,
                  // for border radius we use shape
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Done' ,
                    style: TextStyle(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.bold), ),
                  onPressed: (){
                    if(formkey.currentState!.validate()){
                      // i make it to go to log in to put your registered data in it
                      // but now cant make this feature it needs backend
                      Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => Loginscreen())) ;
                    }
                  },
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}