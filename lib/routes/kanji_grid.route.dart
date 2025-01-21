import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class KanjiGrid extends StatelessWidget {

  final ListView kanjiMeanings;

  const KanjiGrid(this.kanjiMeanings, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(AppLocalizations.of(context)!.kanjiGridTitle)),
      body: Container(child: kanjiMeanings)
    );
  }
}