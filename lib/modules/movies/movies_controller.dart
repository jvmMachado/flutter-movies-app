import 'package:get/get.dart';
import 'package:movies_app/models/genre_model.dart';
import 'package:movies_app/services/movies/movies_service.dart';

import '../../application/ui/messages/messages_mixin.dart';
import '../../models/movie_model.dart';
import '../../services/genres/genres_service.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;
  final _message = Rxn<MessageModel>();
  final genres = <GenreModel>[].obs;
  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  var _initialPopularMovies = <MovieModel>[];
  var _initialPopRatedMovies = <MovieModel>[];

  final selectedGenre = Rxn<GenreModel>();

  MoviesController(
      {required GenresService genresService,
      required MoviesService moviesService})
      : _genresService = genresService,
        _moviesService = moviesService;

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

      final popularMoviesResponse = await _moviesService.getPopularMovies();
      _initialPopularMovies = popularMoviesResponse;
      popularMovies.assignAll(popularMoviesResponse);

      final topRatedMoviesResponse = await _moviesService.getTopRatedmovies();
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
}
