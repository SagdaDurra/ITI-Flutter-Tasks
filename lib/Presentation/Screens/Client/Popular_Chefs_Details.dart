
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:http/http.dart' as http;
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:iti_flutter/Data/Requests/Chefs_Images_Request.dart';
import 'package:iti_flutter/Data/Requests/PopularChefs_Details_request.dart';
import 'package:iti_flutter/Domain/Models/Images_Model.dart';
import 'package:iti_flutter/Domain/Models/Popular_Chefs_Details_Model.dart';

class Popularchefsdetails extends StatefulWidget {

  final num id;

  const Popularchefsdetails({
    super.key,
    required this.id,
  });

  @override
  State<Popularchefsdetails> createState() => _PopularchefsdetailsState();

}

class _PopularchefsdetailsState extends State<Popularchefsdetails> {

  PopularChefsDetails? details;
  ImagesModel? images;

  void initState() {
    super.initState();
    getDetails();
    getImages();
  }

  Future<void> getDetails() async {

  details =
  await Popularchefsdetailsrequest
      .getPopularChefsDetails(widget.id) ;
  setState(() {});
  }
  Future<void> getImages() async {
    images = await ChefsImagesRequest.getImages(widget.id);
    setState(() {});
  }
  Future<void> downloadImage() async {
    final imageUrl =
        'https://image.tmdb.org/t/p/w500${images!.profiles![0].filePath}';

    final response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode != 200) {
      throw Exception('Failed to download image');
    }

    final hasAccess = await Gal.hasAccess();

    if (!hasAccess) {
      final access = await Gal.requestAccess();

      if (!access) {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Gallery permission denied"),
          ),
        );

        return;
      }
    }

    await Gal.putImageBytes(
      response.bodyBytes,
      name: 'chef_image_${widget.id}.jpg',
      album: 'My App',
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Image downloaded successfully"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(icon: Icon(Icons.arrow_back , color: Colors.black , size: 30,  ) , onPressed: () {
              // explaining ??
              // AND explaining why navigator.pop(context) doesnt work??
              Navigator.of(context, rootNavigator: true).pop();
            },),
            Text('Chef Biography' , style: TextStyle(color: Colors.black , fontSize: 40 , fontWeight: FontWeight.bold), ),
          ],
        ),
      ),

      body:
      details == null || images == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: images!.profiles == null ||
                      images!.profiles!.isEmpty
                      ? Text("No image")
                      : InstaImageViewer(
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${images!.profiles![0].filePath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                ElevatedButton.icon(
                  onPressed: downloadImage,
                  icon: Icon(Icons.download),
                  label: Text("Download"),
                ),
                Container(
                        margin: EdgeInsets.all(10),
                        // to make it more flexible with the bio
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                color: Colors.deepPurple[200],
                borderRadius: BorderRadius.circular(10),
                        ),
                        child:Text(
                details!.biography ?? "N/A", style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold),
                        ),

                      ),
              ],
            ),
          ),
    );
  }

}
