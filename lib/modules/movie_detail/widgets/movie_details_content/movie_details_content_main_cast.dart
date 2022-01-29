import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/application/ui/theme_extensions.dart';

import '../../../../models/movie_details_model.dart';
import 'movie_cast.dart';

class MovieDetailsContentMainCast extends StatelessWidget {
  final MovieDetailsModel? movieDetails;
  final showPanel = false.obs;

  MovieDetailsContentMainCast({Key? key, required this.movieDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: context.themeGray,
        ),
        Obx(
          () {
            return ExpansionPanelList(
              elevation: 0,
              expandedHeaderPadding: EdgeInsets.zero,
              expansionCallback: (panelIndex, isExpanded) {
                showPanel.toggle();
              },
              children: [
                ExpansionPanel(
                  canTapOnHeader: false,
                  backgroundColor: Colors.white,
                  isExpanded: showPanel.value,
                  headerBuilder: (context, isExpanded) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Elenco',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  },
                  body: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: movieDetails?.cast
                              .map((c) => MovieCast(
                                    cast: c,
                                  ))
                              .toList() ??
                          [],
                    ),
                  ),
                )
              ],
            );
          },
        )
      ],
    );
  }
}
