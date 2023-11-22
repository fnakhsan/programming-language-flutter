import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:programming_language/model/programming_language.dart';

var informationTextStyle = const TextStyle(fontSize: 16.0);

class DetailScreen extends StatelessWidget {
  final ProgrammingLanguage programmingLanguage;

  const DetailScreen({Key? key, required this.programmingLanguage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(programmingLanguage: programmingLanguage);
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
      appBar: AppBar(
        title: Text(programmingLanguage.name),
        centerTitle: true,
        actions: const [FavoriteButton()],
      ),
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
              Text(
                programmingLanguage.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 28.0, fontWeight: FontWeight.bold),
              ),
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
              ),
              const Padding(padding: EdgeInsets.all(8.0)),
              Text(programmingLanguage.detail)
            ],
          ),
        ),
      ),
    );
  }
}

class DetailWebPage extends StatefulWidget {
  final ProgrammingLanguage programmingLanguage;

  const DetailWebPage({Key? key, required this.programmingLanguage})
      : super(key: key);

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: kIsWeb ? null : AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64,
        ),
        child: Center(
          child: SizedBox(
            width: screenWidth <= 1200 ? 800 : 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.programmingLanguage.name,
                  style: const TextStyle(
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child:
                                Image.asset(widget.programmingLanguage.image),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(),
                                    Text(
                                      widget.programmingLanguage.name,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 30.0,
                                      ),
                                    ),
                                    const FavoriteButton(),
                                  ],
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text("Developer",
                                          style: informationTextStyle),
                                      Text(
                                        "Paradigm",
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Text(
                                          widget.programmingLanguage.developer,
                                          style: informationTextStyle,
                                        ),
                                        Text(
                                          widget.programmingLanguage.paradigm,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: informationTextStyle,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  widget.programmingLanguage.detail,
                                  textAlign: TextAlign.justify,
                                  style: informationTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
