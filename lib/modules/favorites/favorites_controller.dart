import 'package:get/get.dart';
import 'package:movies_app/application/auth/auth_service.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/services/movies/movies_service.dart';

class FavoritesController extends GetxController {
  final MoviesService _moviesService;
  final AuthService _authService;

  final movies = <MovieModel>[].obs;

  FavoritesController(
      {required MoviesService moviesService, required AuthService authService})
      : _moviesService = moviesService,
        _authService = authService;

  @override
  void onReady() {
    super.onReady();
    _getFavorites();
  }

  Future<void> _getFavorites() async {
    var user = _authService.user;
    if (user != null) {
      var favorites = await _moviesService.getFavoriteMovies(user.uid);
      movies.assignAll(favorites);
    }
  }

  Future<void> removeFavorite(MovieModel movie) async {
    var user = _authService.user;
    if (user != null) {
      await _moviesService.addOrRemoveFavorite(
          user.uid, movie.copyWith(favorite: false));
      movies.remove(movie);
    }
  }
}
