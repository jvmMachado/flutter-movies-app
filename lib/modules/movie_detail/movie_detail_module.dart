import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movies_app/modules/movie_detail/movie_detail_bindings.dart';
import 'package:movies_app/modules/movie_detail/movie_detail_page.dart';

import '../../application/modules/module.dart';

class MovieDetailModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
        name: '/movie/detail',
        page: () => const MovieDetailPage(),
        binding: MovieDetailBindings()),
  ];
}
