import 'package:get/get.dart';
import 'package:movies_app/application/auth/auth_service.dart';
import 'package:movies_app/models/genre_model.dart';
import 'package:movies_app/services/movies/movies_service.dart';

import '../../application/ui/messages/messages_mixin.dart';
import '../../models/movie_model.dart';
import '../../services/genres/genres_service.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;
  final AuthService _authService;

  final _message = Rxn<MessageModel>();
  final genres = <GenreModel>[].obs;

  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  var _initialPopularMovies = <MovieModel>[];
  var _initialPopRatedMovies = <MovieModel>[];

  final selectedGenre = Rxn<GenreModel>();

  MoviesController({
    required GenresService genresService,
    required MoviesService moviesService,
    required AuthService authService,
  })  : _genresService = genresService,
        _moviesService = moviesService,
        _authService = authService;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final genresResponse = await _genresService.getGenres();
      genres.assignAll(genresResponse);

      await getMovies();
    } catch (e, s) {
      print(e);
      print(s);
      _message(MessageModel.error(
          title: 'Oops!', message: 'Erro ao carregar dados da página'));
    }
  }

  Future<void> getMovies() async {
    try {
      var popularMoviesResponse = await _moviesService.getPopularMovies();
      var topRatedMoviesResponse = await _moviesService.getTopRatedmovies();
      final favorites = await getFavorites();

      popularMoviesResponse = popularMoviesResponse.map((m) {
        if (favorites.containsKey(m.id)) {
          return m.copyWith(favorite: true);
        } else {
          return m.copyWith(favorite: false);
        }
      }).toList();

      topRatedMoviesResponse = topRatedMoviesResponse.map((m) {
        if (favorites.containsKey(m.id)) {
          return m.copyWith(favorite: true);
        } else {
          return m.copyWith(favorite: false);
        }
      }).toList();

      _initialPopularMovies = popularMoviesResponse;
      popularMovies.assignAll(popularMoviesResponse);

      _initialPopRatedMovies = topRatedMoviesResponse;
      topRatedMovies.assignAll(topRatedMoviesResponse);
    } catch (e, s) {
      print(e);
      print(s);
      _message(MessageModel.error(
          title: 'Oops!', message: 'Erro ao carregar dados da página'));
    }
  }

  void filterByName(String title) {
    if (title.isNotEmpty) {
      var newPopularMovies = _initialPopularMovies.where(
        (movie) => movie.title.toLowerCase().contains(title.toLowerCase()),
      );

      var newTopRatedMovies = _initialPopRatedMovies.where(
        (movie) => movie.title.toLowerCase().contains(title.toLowerCase()),
      );

      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_initialPopularMovies);
      topRatedMovies.assignAll(_initialPopRatedMovies);
    }
  }

  void filterMoviesByGenre(GenreModel? genreFilter) {
    if (genreFilter?.id == selectedGenre.value?.id) {
      genreFilter = null;
    }

    selectedGenre.value = genreFilter;

    if (genreFilter != null) {
      var newPopularMovies = _initialPopularMovies.where(
        (movie) => movie.genres.contains(genreFilter?.id),
      );

      var newTopRatedMovies = _initialPopRatedMovies.where(
        (movie) => movie.genres.contains(genreFilter?.id),
      );

      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_initialPopularMovies);
      topRatedMovies.assignAll(_initialPopRatedMovies);
    }
  }

  Future<void> toggleFavoriteMovie(MovieModel movie) async {
    final user = _authService.user;
    if (user != null) {
      var updatedMovie = movie.copyWith(favorite: !movie.favorite);
      await _moviesService.addOrRemoveFavorite(user.uid, updatedMovie);
      await getMovies();
    }
  }

  Future<Map<int, MovieModel>> getFavorites() async {
    var user = _authService.user;

    if (user != null) {
      final favorites = await _moviesService.getFavoriteMovies(user.uid);
      var favoritesMap = <int, MovieModel>{};
      for (var favorite in favorites) {
        favoritesMap.update(
          favorite.id,
          (value) => value,
          ifAbsent: () => favorite,
        );
      }
      return favoritesMap;
    }
    return {};
  }
}
