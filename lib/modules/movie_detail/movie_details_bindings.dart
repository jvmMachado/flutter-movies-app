import 'package:get/get.dart';
import './movie_details_controller.dart';

class MovieDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MovieDetailsController(moviesService: Get.find()));
  }
}
