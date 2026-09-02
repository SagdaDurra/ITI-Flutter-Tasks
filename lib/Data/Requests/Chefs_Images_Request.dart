import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:iti_flutter/Core/AppAPIs/AllAPIs.dart';
import 'package:iti_flutter/Domain/Models/Images_Model.dart';

class ChefsImagesRequest {
  // cause there is id in the url we pass it here
  static Future <ImagesModel> getImages(num id) async {
    Map<String , String> headers = {};
  var response = await http.get(Uri.parse('${Allapis.getPopularChefsImages}/$id/images?api_key=2dfe23358236069710a379edd4c65a6b',),
  headers: headers ,
  ) ;
  if(response.statusCode == 200){
  return ImagesModel.fromJson(jsonDecode(response.body));
  } else {
  log(response.statusCode.toString(), name: "your status code is :");
  return Future.error("Error in getting popular chefs");
  }

    }
}