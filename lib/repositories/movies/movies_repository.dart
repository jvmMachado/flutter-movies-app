import 'package:movies_app/models/movie_details_model.dart';

import '../../models/movie_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedmovies();
  Future<MovieDetailsModel?> getDetails(int id);
}
