import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:iti_flutter/Core/AppAPIs/AllAPIs.dart';
import 'package:iti_flutter/Domain/Models/Popular_Chefs_Details_Model.dart';

class Popularchefsdetailsrequest {
  // this id is not for details model its for the popular chefs model and we pass
  // it here to make this request bring the id (s) bio

  static Future<PopularChefsDetails> getPopularChefsDetails(num id) async{
    Map<String , String>? headers = {};
    var response = await http.get(Uri.parse('${Allapis.getPopularChefsDetails}/$id?api_key=2dfe23358236069710a379edd4c65a6b'),
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