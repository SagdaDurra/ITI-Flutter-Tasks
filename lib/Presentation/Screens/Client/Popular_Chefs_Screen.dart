import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter/Domain/Models/Popular_Chefs_Model.dart';
import 'package:iti_flutter/Presentation/Cubits/favourite_chefs_cubit.dart';
import 'package:iti_flutter/Presentation/Cubits/popular_chefs_cubit.dart';
import 'package:iti_flutter/Presentation/Screens/Nav%20Bar/Bottomnavbar.dart';
import 'package:iti_flutter/Presentation/Screens/User/Favourite_Chefs_Screen.dart';

class Popular_Chefs_Model extends StatefulWidget{
  //why??
  //bool fill = false ;
  //FavoutriteChefsScreen(favoriteChefs) {
  //  // TODO: implement FavoutriteChefsScreen
  //  throw UnimplementedError();
  //}
  @override
  State<Popular_Chefs_Model> createState() => _Popular_Chefs_ModelState();
}

class _Popular_Chefs_ModelState extends State<Popular_Chefs_Model> {
  // for making the all cards favourite
//  bool fill = false ;
  //Set<num> favoriteChefs = {};
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
             // the diff between inkwell and gesturedetector ----->
             return Material(
                 elevation: 2,
                   child: InkWell(
                     onTap: (){
                       final ChefId = state.popularChefsModel.results![index].id!;
                       Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar( id: ChefId)));
                       //Navigator.push(context, MaterialPageRoute(builder: (context) => Popularchefsdetails( id: state.popularChefsModel.results![index].id!,)));
                     },
                     child: Container(
                           height: 150,
                           width: 250,
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(20),
                           ),
                           margin: EdgeInsets.all(10),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [

                           Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Row(
                                 children: [
                                   Text(
                                     "Name : ",
                                     style: TextStyle(
                                       color: Colors.deepPurple,
                                       fontSize: 20,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                   Text(
                                     state.popularChefsModel.results?[index].name.toString() ??
                                         "N/A",
                                     style: TextStyle(
                                       color: Colors.black,
                                       fontSize: 15,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                 ],
                               ),

                               Row(
                                 children: [
                                   Text(
                                     "Popularity : ",
                                     style: TextStyle(
                                       color: Colors.deepPurple,
                                       fontSize: 20,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                   Text(
                                     state.popularChefsModel.results?[index].popularity.toString() ??
                                         "N/A",
                                     style: TextStyle(
                                       color: Colors.black,
                                       fontSize: 15,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                 ],
                               ),

                               Row(
                                 children: [
                                   Text(
                                     "Adult : ",
                                     style: TextStyle(
                                       color: Colors.deepPurple,
                                       fontSize: 20,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                   Text(
                                     state.popularChefsModel.results?[index].adult.toString() ??
                                         "N/A",
                                     style: TextStyle(
                                       color: Colors.black,
                                       fontSize: 15,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                           
                           BlocBuilder<FavoriteChefsCubit, Set<num>>(
  builder: (context, favoriteIDS) {
    return IconButton(
                             onPressed: () {
                               //setState(() {
                                //final chefId =
                                //state.popularChefsModel.results![index].id!;

                                //context
                                //    .read<FavoriteChefsCubit>()
                                //    .toggleFavorite(chefId);

                                //final ChefId = state.popularChefsModel.results![index].id!;
                                //if (favoriteChefs.contains(ChefId)) {
                                //  favoriteChefs.remove(ChefId);
                                //} else {
                                //  favoriteChefs.add(ChefId);
                                //}
                                 //fill = true;
                              // });
                               final chefId =
                               state.popularChefsModel.results![index].id!;

                               context
                                   .read<FavoriteChefsCubit>()
                                   .toggleFavorite(chefId);
                             },
                             icon:favoriteIDS.contains(state.popularChefsModel.results![index].id!)
                             //fill
                                 ? Icon(
                               Icons.favorite,
                               color: Colors.deepPurple,
                               size: 30,
                             )
                                 : Icon(
                               Icons.favorite_border,
                               color: Colors.deepPurple,
                               size: 30,
                             ),
                           );
  },
),
                         ],
                       ),
                   ),
               )
             );
           },
           separatorBuilder:(context , index){
             return SizedBox(height: 10);
           },
         // the num of things will i get from api
           itemCount: state.popularChefsModel!.results?.length??0 ,
           scrollDirection: Axis.vertical,
       )
     : Center(child: Text("an error occured"));
  },
) ,
   );
  }
}