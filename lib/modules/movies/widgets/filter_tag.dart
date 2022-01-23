import 'package:flutter/material.dart';
import 'package:movies_app/application/ui/theme_extensions.dart';
import 'package:movies_app/models/genre_model.dart';

class FilterTag extends StatelessWidget {
  final GenreModel model;
  final bool selected;
  final VoidCallback onPressed;

  const FilterTag({
    Key? key,
    required this.model,
    this.selected = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(minWidth: 100, maxHeight: 30),
        decoration: BoxDecoration(
          color: selected ? context.themeRed : Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            model.name,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
