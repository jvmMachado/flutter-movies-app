import '../../models/movie_details_model.dart';
import '../../models/movie_model.dart';

abstract class MoviesService {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedmovies();
  Future<MovieDetailsModel?> getDetails(int id);
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie);
  Future<List<MovieModel>> getFavoriteMovies(String userId);
}
