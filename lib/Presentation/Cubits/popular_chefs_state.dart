part of 'popular_chefs_cubit.dart';

// preparing states

sealed class PopularChefsState extends Equatable {
  const PopularChefsState();
}

// this the initial state
final class PopularChefsInitial extends PopularChefsState {
  @override
  List<Object> get props => [];
}

// this is the loading state
final class PopularChefsLoading extends PopularChefsState {
  @override
  List<Object> get props => [];
}

//this is the success state
final class PopularChefsSuccess extends PopularChefsState {
  // now making an object of the model
  final PopularChefsModel popularChefsModel;
  // if success bring the model
  const PopularChefsSuccess(this.popularChefsModel);
  @override
  List<Object> get props => [popularChefsModel];
}

// this is the error state
final class PopularChefsError extends PopularChefsState {
  final String message ="Error in getting popular chefs";
  const PopularChefsError(String message) ;
  @override
  List<Object> get props => [message];
}

