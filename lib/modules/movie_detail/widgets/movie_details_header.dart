import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/models/movie_detail_model.dart';
import 'package:movies_app/modules/movie_detail/movie_details_controller.dart';

class MovieDetailsHeader extends GetView<MovieDetailsController> {
  final MovieDetailModel? movie;

  const MovieDetailsHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (movie != null) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movie!.urlImages.length,
          itemBuilder: (context, index) {
            final image = movie!.urlImages[index];
            return Padding(
              padding: const EdgeInsets.all(2),
              child: Image.network(image),
            );
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
