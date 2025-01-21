import 'package:flutter/material.dart';

class KanjiGrid extends StatelessWidget {

  final ListView kanjiMeanings;

  const KanjiGrid(this.kanjiMeanings, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Kanji Grid")),
      body: Container(child: kanjiMeanings)
    );
  }
}