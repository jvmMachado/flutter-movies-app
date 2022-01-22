import 'package:movies_app/models/genre_model.dart';

import '../../application/rest_client/rest_client.dart';
import './genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;

  GenresRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClient.get<List<GenreModel>>('/genre/movie/list',
        decoder: (data) {
      final resultData = data['genres'];
      if (resultData != null) {
        return resultData
            .map<GenreModel>((genre) => GenreModel.fromMap(genre))
            .toList();
      } else {
        return <GenreModel>[];
      }
    });

    if (result.hasError) {
      print(result.statusText);
      throw Exception('Erro ao buscar gêneros');
    }

    return result.body ?? <GenreModel>[];
  }
}
