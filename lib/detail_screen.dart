import 'package:flutter/material.dart';
import 'package:programming_language/model/programming_language.dart';
import 'package:programming_language/model/programming_language_data.dart';

class DetailScreen extends StatelessWidget {
  final ProgrammingLanguage programmingLanguage;

  const DetailScreen({Key? key, required this.programmingLanguage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          // return DetailWebPage(place: place);
          return const Text("detail");
        } else {
          // return DetailMobilePage(place: place);
          return const Text("detail");
        }
      },
    );
  }
}