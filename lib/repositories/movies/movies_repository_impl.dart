import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:movies_app/application/rest_client/rest_client.dart';
import 'package:movies_app/models/movie_details_model.dart';
import 'package:movies_app/models/movie_model.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;

  MoviesRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/popular',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1',
      },
      decoder: (data) {
        final results = data['results'];

        if (results != null) {
          return results
              .map<MovieModel>((movie) => MovieModel.fromMap(movie))
              .toList();
        }

        return <MovieModel>[];
      },
    );

    if (result.hasError) {
      print('Erro ao buscar os filmes mais populares [${result.statusText}]');
      throw Exception('Erro ao buscar os filmes mais populares');
    }

    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRatedmovies() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/top_rated',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1',
      },
      decoder: (data) {
        final results = data['results'];

        if (results != null) {
          return results
              .map<MovieModel>((movie) => MovieModel.fromMap(movie))
              .toList();
        }

        return <MovieModel>[];
      },
    );

    if (result.hasError) {
      print(
          'Erro ao buscar os filmes mais bem avaliados [${result.statusText}]');
      throw Exception('Erro ao buscar os filmes mais bem avaliados');
    }

    return result.body ?? <MovieModel>[];
  }

  @override
  Future<MovieDetailsModel?> getDetails(int id) async {
    final result = await _restClient.get<MovieDetailsModel?>(
      '/movie/$id',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'append_to_response': 'images,credits',
        'include_image_language': 'en,pt-br',
      },
      decoder: (data) {
        return MovieDetailsModel.fromMap(data);
      },
    );

    if (result.hasError) {
      print('Erro ao buscar detalhes do filme [${result.statusText}]');
      throw Exception('Erro ao buscar detalhes do filme');
    }

    return result.body;
  }

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie) async {
    try {
      var favoriteCollection = FirebaseFirestore.instance
          .collection('favorites')
          .doc(userId)
          .collection('movies');

      if (movie.favorite) {
        favoriteCollection.add(movie.toMap());
      } else {
        var favoriteData = await favoriteCollection
            .where('id', isEqualTo: movie.id)
            .limit(1)
            .get();

        favoriteData.docs.first.reference.delete();
      }
    } catch (e) {
      print('Erro ao favoritar um filme');
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getFavoriteMovies(String userId) async {
    var favoriteMovies = await FirebaseFirestore.instance
        .collection('favorites')
        .doc(userId)
        .collection('movies')
        .get();

    final favoritesList = <MovieModel>[];

    for (var movie in favoriteMovies.docs) {
      favoritesList.add(MovieModel.fromMap(movie.data()));
    }

    return favoritesList;
  }
}
