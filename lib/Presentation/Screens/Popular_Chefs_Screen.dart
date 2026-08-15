import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter/Domain/Models/Popular_Chefs_Model.dart';
import 'package:iti_flutter/Presentation/Cubits/popular_chefs_cubit.dart';

class Popular_Chefs_Model extends StatefulWidget{
  @override
  State<Popular_Chefs_Model> createState() => _Popular_Chefs_ModelState();
}

class _Popular_Chefs_ModelState extends State<Popular_Chefs_Model> {
  PopularChefsModel? popularChefsModel ;

  // we use it before using cubit
 // Future<void> getChefs() async {
 //    popularChefsModel =
 //   await PopularChefsRequest.getPopularChefs();
 //    setState(() {});
 // }

  // PopularChefsRequest.getPopularChefs(); ------> why?
  // forever every time the screen build it calls the init state so should but in it the get method
  @override
  void initState() {
    super.initState();
    //PopularChefsRequest.getPopularChefs();
    //getChefs(); // you should before building to go to bring the data from the server
    BlocProvider.of<PopularChefsCubit>(context).getPopularChefs();
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Popular Chefs' , style: TextStyle(color: Colors.black , fontSize: 40 , fontWeight: FontWeight.bold), ),
     ),
     
     body:
     // popularChefsModel == null ? Center(child: CircularProgressIndicator()) :
     BlocBuilder<PopularChefsCubit , PopularChefsState>(
  builder: (context, state) {
    return state is PopularChefsLoading
        ? Center(child: CircularProgressIndicator())
        : state is PopularChefsSuccess
    ?
     ListView.separated(
         itemBuilder: (context , index){
           return Material(
             elevation: 2,
             child: Container(
                   height: 150,
                   width: 250,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(20),
                   ),
                   margin: EdgeInsets.all(10),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       Text("Name : ", style : TextStyle(color: Colors.deepPurple , fontSize: 20 , fontWeight: FontWeight.bold), ),
                       Text(state.popularChefsModel.results?[index].name.toString()  ?? "N/A" , style : TextStyle(color: Colors.black , fontSize: 15 , fontWeight: FontWeight.bold), ),
                     ],
                   ) ,
                   Row(
                     children: [
                       Text("Popularity : ", style : TextStyle(color: Colors.deepPurple , fontSize: 20 , fontWeight: FontWeight.bold), ),
                       Text(state.popularChefsModel.results?[index].popularity.toString()  ?? "N/A" , style : TextStyle(color: Colors.black , fontSize: 15 , fontWeight: FontWeight.bold), ),
                     ],
                   ) ,
                   Row(
                     children: [
                       Text("Adult : ", style : TextStyle(color: Colors.deepPurple , fontSize: 20 , fontWeight: FontWeight.bold), ),
                       Text(state.popularChefsModel.results?[index].adult.toString()  ?? "N/A" , style : TextStyle(color: Colors.black , fontSize: 15 , fontWeight: FontWeight.bold), ),
                     ],
                   ) ,

                 ],
               ),
                 ),
           );

         },
         separatorBuilder:(context , index){
           return SizedBox(height: 10);
         },
       // the num of things will i get from api
         itemCount: state.popularChefsModel!.results?.length??0 ,
         scrollDirection: Axis.vertical,
     ): Center(child: Text("an error occured"));
  },
) ,
   );
  }
}