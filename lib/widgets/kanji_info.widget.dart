import 'package:flutter/material.dart';
import 'package:kanji_dictionary/kanji_dictionary.dart';
import 'package:kotoba/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_kanjivg/flutter_kanjivg.dart';
import 'package:kotoba/utils/kanji_utils.utils.dart';

class KanjiInfo extends StatefulWidget {
  final Character kanji;

  const KanjiInfo(this.kanji, {super.key});

  @override
  State<KanjiInfo> createState() => _KanjiInfoState();
}

class _KanjiInfoState extends State<KanjiInfo> with TickerProviderStateMixin {
  late Language _kanjiDicLang = kanjiDicLang;
  final KanjiParser _parser = KanjiParser();
  late int _strokeCount = 0;

  // We simply can't do that because we need to pass this as a param
  // ignore: prefer_final_fields
  late KanjiController _kanjiController =
      KanjiController(vsync: this, duration: const Duration(seconds: 5));

  @override
  void initState() {
    if (widget.kanji.meanings[kanjiDicLang] == null) {
      _kanjiDicLang = Language.english;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<String> source = getKanjiVGFileAsString(widget.kanji.literal);
    return FutureBuilder(
        future: source,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final KvgData data = _parser.parse("${snapshot.data}");

            _strokeCount = data.strokes;

            _kanjiController
              ..load(data)
              ..forward();
          }
          return ListView(children: [
            KanjiCanvas(
                controller: _kanjiController,
                size: 260,
                thickness: 6,
                color: Theme.of(context).colorScheme.secondary),
            Divider(),
            // Meanings
            Text(
                "${AppLocalizations.of(context)!.kanjiMeanings}",
                style: TextStyle(fontSize: 30, color: Theme.of(context).colorScheme.secondary), textAlign: TextAlign.center),
            Text(
                "${widget.kanji.meanings[_kanjiDicLang]}",
                style: TextStyle(fontSize: 30)),
            Divider(),
            // Readings
            Text(
                "${AppLocalizations.of(context)!.kanjiReadings}",
                style: TextStyle(fontSize: 30, color: Theme.of(context).colorScheme.secondary), textAlign: TextAlign.center),
            Text(
                "${AppLocalizations.of(context)!.kanjiKun}: ${widget.kanji.readings[Reading.japaneseKun]}",
                style: TextStyle(fontSize: 30)),
            Text(
                "${AppLocalizations.of(context)!.kanjiOn}: ${widget.kanji.readings[Reading.japaneseOn]}",
                style: TextStyle(fontSize: 30)),
            Divider(),
            // Difficulty
            Text(
                "${AppLocalizations.of(context)!.kanjiDifficulty}",
                style: TextStyle(fontSize: 30, color: Theme.of(context).colorScheme.secondary), textAlign: TextAlign.center),
            Text(
                "${AppLocalizations.of(context)!.kanjiGrade}: ${widget.kanji.difficulty.grade}",
                style: TextStyle(fontSize: 30)),
            Text(
                "${AppLocalizations.of(context)!.kanjiJLPTLevel}: ${widget.kanji.difficulty.jlpt}",
                style: TextStyle(fontSize: 30)),
            Divider(),
            // Misc
            Text(
                "${AppLocalizations.of(context)!.kanjiMisc}",
                style: TextStyle(fontSize: 30, color: Theme.of(context).colorScheme.secondary), textAlign: TextAlign.center),
            Text(
                "${AppLocalizations.of(context)!.kanjiStrokeCount}: $_strokeCount",
                style: TextStyle(fontSize: 30)),
          ]);
        });
  }

  @override
  void dispose() {
    _kanjiController.dispose();

    super.dispose();
  }
}
