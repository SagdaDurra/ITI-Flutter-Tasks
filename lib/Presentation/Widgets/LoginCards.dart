import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logincards extends StatefulWidget {
  Widget ? child ;
  String ? hintText ;
  Widget ? prefix ;
  Widget ? suffix ;
  TextInputType ? keyboardType ;
  // controller allows you to control the text field(data written in text field)
  TextEditingController ? emailController = TextEditingController() ;
  TextEditingController ? passwordController = TextEditingController() ;

  // its a key make you access to the form when written like this (formKey.currentState!.validate()) :
  // means go to this form and make validation for all the textformfield in it and return true or false
  // formKey.currentState!.validate() : gives true or false
  // any widget changes in flutter has state so the form has FormState
  // for the key.currentState it is an object of the form state
  // currentState is a property in the global key class
  // TextEditingController >>>>>> a class that has properties and methods like text that when calling give you the text
  // in the text field
  // if making Form on a reusable widget of textFormField every time you call the constructor you
  // will create a new key and a new form
  // and this will make the current State of the form to be null

  String? Function(String?)? validator;
  bool? secure ;
  // every textFormField has a form and has key :) bc every time
  // we call the constructor of login cards we will create a new key and a new form
  // we should use automatic and manual validation to make navigation and
  // bc navigation depends on the validation of the all data
  //  automatic validation only guard feed back cant make navigation(action)

  Logincards({this.child , this.hintText , this.prefix ,this.suffix ,
    this.keyboardType , this.emailController , this.passwordController ,  this.validator ,
    this.secure = false });

  @override
  State<Logincards> createState() => _LogincardsState();
}

class _LogincardsState extends State<Logincards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // form : is container that contains text form fields widgets
      // (email container and pass container )
        // he makes validation every time the user types
        //key: GlobalKey<FormState>(), -----> another method for setting key
        child: TextFormField(
          // flutter function to validate the input
          // we put it in the TextFormField
          validator:widget.validator! ,
          obscureText:widget.secure! ,

          //controller: TextEditingController(),-----> method for setting controller
          enabled: true,
          decoration: InputDecoration(
            prefixIcon: widget.prefix,
            // cant make here (!) bc already i didnt pass it for email :_(
            suffixIcon: widget.suffix,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey ,
                fontSize: 15 , fontWeight: FontWeight.bold),
            //filled: true,
            //fillColor: Colors.deepPurple[300],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.deepPurple,
              ),
            ),
          ),
          keyboardType: widget.keyboardType,

        ),

    );
    //Container(
           //width: 400,
           //height: 100,
           //margin: EdgeInsets.all(10),
           //decoration: BoxDecoration(
           //  color: Colors.deepPurple[200],
           //  borderRadius: BorderRadius.circular(20),
           //),
           //  child: child, // must use it in class again not only passing
  }
}