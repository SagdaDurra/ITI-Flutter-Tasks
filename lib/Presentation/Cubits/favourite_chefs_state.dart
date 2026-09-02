
import 'package:equatable/equatable.dart' show Equatable;

sealed class FavouriteChefsState extends Equatable {
  const FavouriteChefsState();
}

final class FavouriteChefsInitial extends FavouriteChefsState {
  @override
  List<Object> get props => [];
}
