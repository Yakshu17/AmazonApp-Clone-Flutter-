import 'package:amazon_clone/Utils/color_themes.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

class SearchBarWidegt extends StatefulWidget implements PreferredSizeWidget {
  const SearchBarWidegt({Key? key}) :preferredSize = const Size.fromHeight(80), super(key: key);

  final Size preferredSize;
  @override
  State<SearchBarWidegt> createState() => SearchBarWidegtState();
}

class SearchBarWidegtState extends State<SearchBarWidegt> {
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: Colors.black,
      child: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: backgroundGradient,begin: Alignment.centerLeft,end: Alignment.center)),
      ),
    );
  }
}



