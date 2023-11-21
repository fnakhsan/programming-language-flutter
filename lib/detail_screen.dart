import 'package:flutter/material.dart';
import 'package:programming_language/model/programming_language.dart';
import 'package:programming_language/model/programming_language_data.dart';

class DetailScreen extends StatelessWidget {
  final ProgrammingLanguage programmingLanguage;

  const DetailScreen({Key? key, required this.programmingLanguage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          // return DetailWebPage(programmingLanguage: programmingLanguage);
          return const Text("detail");
        } else {
          return DetailMobilePage(programmingLanguage: programmingLanguage);
        }
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final ProgrammingLanguage programmingLanguage;

  const DetailMobilePage({Key? key, required this.programmingLanguage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SafeArea(
              child: Image.asset(programmingLanguage.image),
            ),
            const Padding(padding: EdgeInsets.all(8.0)),
            Text(programmingLanguage.name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),),
            const Padding(padding: EdgeInsets.all(8.0)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Column(
                  children: <Widget>[
                    Text("Developer"),
                    Text("Paradigm"),
                  ],
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(programmingLanguage.developer),
                      Text(
                        programmingLanguage.paradigm,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
