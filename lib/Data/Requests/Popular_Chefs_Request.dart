import 'dart:convert';
import 'dart:developer';

import 'package:iti_flutter/Core/AppAPIs/AllAPIs.dart';
import 'package:iti_flutter/Domain/Models/Popular_Chefs_Model.dart';
// we put as http cause http of the api is different from http of flutter
import 'package:http/http.dart' as http ;
// 'String' is not a subtype of type 'int' of 'index'

// GET needs two things :
// 1- Map of headers the backend dev will say to you what to write in it then pass it to it (optional)
// 2- the uri url of the api

// the response had two things :
// 1- the status code that num that server sent back to say if the request was successful or not
// 2- the body that the server sent back to us (the data)
class PopularChefsRequest {
// method for getting popular chefs , we will use it in alot of things
// if success returning object of the response.body
  static Future<PopularChefsModel> getPopularChefs() async{

    Map<String , String>? headers = {};
    // url with uri data type so will make parsing (converting)
    // await bc when sent the link to get the data from server
    // there is a period that we will wait for the data thats
    // why we use await
    var response = await http.get(Uri.parse(Allapis.getPopularChefs),
        headers: headers ,
    ) ;

    if(response.statusCode == 200){

      // the length of the one calling
     // print(PopularChefsModel.fromJson(jsonDecode(response.body)).results?.length);
      // must make this to access the vars in the model bc they arenot static
     PopularChefsModel popularChefsModel = PopularChefsModel();
     // print( popularChefsModel);
     // for testing
      print(response.body);
      // this line recieves the body in object form not in the class
      return PopularChefsModel.fromJson(jsonDecode(response.body));

      // i put to String to see what will come from the server
      // bc it comes with json language

    }else{
      log(response.statusCode.toString(), name: "your status code is :");
      return Future.error("Error in getting popular chefs");
    }
  }
}