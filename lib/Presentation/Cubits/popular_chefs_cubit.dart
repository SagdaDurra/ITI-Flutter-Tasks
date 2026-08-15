import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iti_flutter/Data/Requests/Popular_Chefs_Request.dart';
import 'package:iti_flutter/Domain/Models/Popular_Chefs_Model.dart';

part 'popular_chefs_state.dart';

// tells the story of the states

class PopularChefsCubit extends Cubit<PopularChefsState> {
  PopularChefsCubit() : super(PopularChefsInitial());

  getPopularChefs() async {
    emit(PopularChefsLoading());
    var response = await PopularChefsRequest.getPopularChefs();
    //if (response != null) {
    //  emit(PopularChefsSuccess(response));
    //} else {
    //  emit(PopularChefsError("Error in getting popular chefs"));
    //}
    // message ----> normal parameter
    response?.results != null
        ? emit(PopularChefsSuccess(response!)) //if response.results != null
        : emit(PopularChefsError("Error in getting popular chefs")); //if response.results == null
  }
}
