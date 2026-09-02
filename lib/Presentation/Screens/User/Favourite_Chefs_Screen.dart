// Need to learn more about this screen ???


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter/Presentation/Cubits/favourite_chefs_cubit.dart';
import 'package:iti_flutter/Presentation/Cubits/popular_chefs_cubit.dart';

class FavoutriteChefsScreen extends StatefulWidget {
  const FavoutriteChefsScreen({super.key});

  @override
  State<FavoutriteChefsScreen> createState() =>
      _FavoutriteChefsScreenState();
}

class _FavoutriteChefsScreenState
    extends State<FavoutriteChefsScreen> {

  @override
  void initState() {
    super.initState();

    context.read<PopularChefsCubit>().getPopularChefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourite Chefs',
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: BlocBuilder<FavoriteChefsCubit, Set<num>>(
        builder: (context, favoriteIds) {

          return BlocBuilder<PopularChefsCubit, PopularChefsState>(
            builder: (context, state) {

              if (state is PopularChefsLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is PopularChefsSuccess) {

                final favoriteChefs =
                state.popularChefsModel.results!
                    .where(
                      (chef) =>
                      favoriteIds.contains(chef.id),
                )
                    .toList();

                if (favoriteChefs.isEmpty) {
                  return Center(
                    child: Text(
                      "No Favourite Chefs",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: favoriteChefs.length,

                  itemBuilder: (context, index) {

                    final chef = favoriteChefs[index];

                    return Container(
                      height: 150,
                      width: 250,
                      margin: EdgeInsets.all(10),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                        children: [

                          Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,

                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              Row(
                                children: [
                                  Text(
                                    "Name : ",
                                    style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontSize: 20,
                                      fontWeight:
                                      FontWeight.bold,
                                    ),
                                  ),

                                  Text(
                                    chef.name ?? "N/A",
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
                                      fontWeight:
                                      FontWeight.bold,
                                    ),
                                  ),

                                  Text(
                                    chef.popularity
                                        ?.toString() ??
                                        "N/A",
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
                                      fontWeight:
                                      FontWeight.bold,
                                    ),
                                  ),

                                  Text(
                                    chef.adult?.toString() ??
                                        "N/A",
                                  ),
                                ],
                              ),
                            ],
                          ),

                          IconButton(
                            onPressed: () {
                              context
                                  .read<FavoriteChefsCubit>()
                                  .toggleFavorite(chef.id!);
                            },

                            icon: Icon(
                              Icons.favorite,
                              color: Colors.deepPurple,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }

              return Center(
                child: Text("An error occurred"),
              );
            },
          );
        },
      ),
    );
  }
}