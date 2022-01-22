import 'package:flutter/material.dart';
import 'package:movies_app/application/ui/theme_extensions.dart';

class FilterTag extends StatelessWidget {
  const FilterTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      constraints: const BoxConstraints(minWidth: 100, maxHeight: 30),
      decoration: BoxDecoration(
        color: context.themeRed,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Center(
        child: Text(
          'Infantil',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
