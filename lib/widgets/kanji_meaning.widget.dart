import 'package:flutter/material.dart';
import 'package:kanji_dictionary/kanji_dictionary.dart';
import 'package:kotoba/utils/kanji_utils.utils.dart';
import 'package:kotoba/widgets/kanji_info.widget.dart';
import 'package:kotoba/main.dart';

class KanjiMeaningWidget extends StatefulWidget {
  final String kanji;

  const KanjiMeaningWidget(this.kanji, {super.key});

  @override
  State<KanjiMeaningWidget> createState() => _KanjiMeaningWidgetState();
}

class _KanjiMeaningWidgetState extends State<KanjiMeaningWidget> {
  dynamic _kanjiInfo;
  Language _kanjiDicLang = kanjiDicLang;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        if (_kanjiInfo != null) {
          showModalBottomSheet(showDragHandle: false, context: context, 
            builder: (context) {
              return KanjiInfo(_kanjiInfo);
            }
          )
        }
      },
      child: Container(
        constraints: BoxConstraints(minHeight: 200, minWidth: 500),
        child: FutureBuilder(future: getKanjiInfo(widget.kanji), 
        builder:(context, snapshot) {

          if (snapshot.data != null) _kanjiInfo = snapshot.data!;

          if (snapshot.data?.meanings[kanjiDicLang] == null) {
            _kanjiDicLang = Language.english;
          } else _kanjiDicLang = kanjiDicLang;

          return Card(
          color: Theme.of(context).colorScheme.secondary,
          child: Column(
            children: [
              Text("${snapshot.data?.literal}", style: TextStyle(fontSize: 80)),
              Text("${snapshot.data?.meanings[_kanjiDicLang]!.first}",  style: TextStyle(fontSize: 30))
            ]
          )
          );
        }
        ),
      ),
    );
  }
}