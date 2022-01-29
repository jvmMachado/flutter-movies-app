import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/modules/movie_detail/widgets/movie_details_content/movie_details_content.dart';
import 'package:movies_app/modules/movie_detail/widgets/movie_details_header.dart';
import 'movie_details_controller.dart';

class MovieDetailsPage extends GetView<MovieDetailsController> {
  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
      ),
      body: SingleChildScrollView(
        child: (Obx(
          () {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieDetailsHeader(
                  movieDetails: controller.movieDetails.value,
                ),
                MovieDetailsContent(
                    movieDetails: controller.movieDetails.value),
              ],
            );
          },
        )),
      ),
    );
  }
}
