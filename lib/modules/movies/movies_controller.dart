import 'package:get/get.dart';
import 'package:movies_app/models/genre_model.dart';

import '../../application/ui/messages/messages_mixin.dart';
import '../../services/genres/genres_service.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresService _genresService;
  final _message = Rxn<MessageModel>();
  final genres = <GenreModel>[].obs;

  MoviesController({required GenresService genresService})
      : _genresService = genresService;

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
    } catch (e) {
      _message(MessageModel.error(
          title: 'Oops!', message: 'Erro ao buscar gêneros'));
    }
  }
}
