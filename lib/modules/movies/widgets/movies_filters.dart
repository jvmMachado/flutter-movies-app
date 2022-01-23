import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/modules/movies/movies_controller.dart';
import 'package:movies_app/modules/movies/widgets/filter_tag.dart';

class MoviesFilters extends GetView<MoviesController> {
  const MoviesFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(() {
            return Row(
              children: controller.genres
                  .map(
                    (genre) => FilterTag(
                      model: genre,
                      onPressed: () {},
                    ),
                  )
                  .toList(),
            );
          })),
    );
  }
}
