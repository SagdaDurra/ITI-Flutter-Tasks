import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:iti_flutter/Core/AppAPIs/AllAPIs.dart';
import 'package:iti_flutter/Domain/Models/Popular-Chefs-Details-Model.dart';

class Popularchefsdetailsrequest {

  static Future<PopularChefsDetails> getPopularChefsDetails(num id) async{
    Map<String , String>? headers = {};
    var response = await http.get(Uri.parse(Allapis.getPopularChefsDetails),
        headers: headers ,
    ) ;
    if(response.statusCode == 200){
      return PopularChefsDetails.fromJson(jsonDecode(response.body));
    }else{
      log(response.statusCode.toString(), name: "your status code is :");
      return Future.error("Error in getting popular chefs");
    }
  }
}