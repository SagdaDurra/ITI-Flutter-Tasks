import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteChefsCubit extends Cubit<Set<num>> {
  FavoriteChefsCubit() : super({});

  void toggleFavorite(num chefId) {
    final favorites = Set<num>.from(state);

    if (favorites.contains(chefId)) {
      favorites.remove(chefId);
    } else {
      favorites.add(chefId);
    }

    emit(favorites);
  }
}