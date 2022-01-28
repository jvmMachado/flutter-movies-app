import 'package:movies_app/models/movie_detail_model.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/repositories/movies/movies_repository.dart';

import './movies_service.dart';

class MoviesServiceImpl implements MoviesService {
  final MoviesRepository _moviesRepository;
  MoviesServiceImpl({
    required MoviesRepository moviesRepository,
  }) : _moviesRepository = moviesRepository;

  @override
  Future<List<MovieModel>> getPopularMovies() =>
      _moviesRepository.getPopularMovies();

  @override
  Future<List<MovieModel>> getTopRatedmovies() =>
      _moviesRepository.getTopRatedmovies();

  @override
  Future<MovieDetailModel?> getDetails(int id) =>
      _moviesRepository.getDetails(id);
}
