import 'package:get/get.dart';
import 'package:movies_app/application/ui/loader/loader_mixin.dart';
import 'package:movies_app/application/ui/messages/messages_mixin.dart';
import 'package:movies_app/models/movie_detail_model.dart';
import 'package:movies_app/services/movies/movies_service.dart';

class MovieDetailsController extends GetxController
    with LoaderMixin, MessagesMixin {
  final MoviesService _moviesService;

  var loading = false.obs;
  var message = Rxn<MessageModel>();
  var movieDetails = Rxn<MovieDetailModel>();

  MovieDetailsController({required MoviesService moviesService})
      : _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final movieId = Get.arguments;
      loading(true);
      final movieDetailsData = await _moviesService.getDetails(movieId);
      movieDetails(movieDetailsData);
      loading(false);
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(MessageModel.error(
          title: 'Erro', message: 'Erroao buscar detalhes do filme'));
    }
  }
}
