import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_flutter/Data/Requests/Popular-Chefs-Details-request.dart';
import 'package:iti_flutter/Domain/Models/Popular-Chefs-Details-Model.dart';

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

  void initState() {
    super.initState();
    getDetails();
  }

  Future<void> getDetails() async {

  details =
  await Popularchefsdetailsrequest
      .getPopularChefsDetails(widget.id) ;
  setState(() {});
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
      details == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Container(
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
    );
  }

}
