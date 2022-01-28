import 'package:movies_app/models/movie_detail_model.dart';

import '../../models/movie_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedmovies();
  Future<MovieDetailModel?> getDetails(int id);
}
