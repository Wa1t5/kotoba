import 'package:flutter/material.dart';
import 'package:kotoba/utils/kanji_utils.utils.dart';
import 'package:kotoba/widgets/kanji_info.widget.dart';


class KanjiMeaningWidget extends StatefulWidget {
  final String kanji;

  const KanjiMeaningWidget(this.kanji, {super.key});

  @override
  State<KanjiMeaningWidget> createState() => _KanjiMeaningWidgetState();
}

class _KanjiMeaningWidgetState extends State<KanjiMeaningWidget> {
  dynamic kanjiInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        if (kanjiInfo != null) {
          showModalBottomSheet(showDragHandle: true, context: context, 
            builder: (context) {
              return KanjiInfo(kanjiInfo);
            }
          )
        }
      },
      child: Container(
        constraints: BoxConstraints(minHeight: 200, minWidth: 500),
        child: FutureBuilder(future: getKanjiInfo(widget.kanji), 
        builder:(context, snapshot) {
          if (snapshot.data != null) kanjiInfo = snapshot.data!;

          return Card(
          color: Theme.of(context).colorScheme.secondary,
          child: Column(
            children: [
              Text("${snapshot.data?.data?.kanji}", style: TextStyle(fontSize: 80)),
              Text("${snapshot.data?.data?.meaning}",  style: TextStyle(fontSize: 30))
            ]
          )
          );
        }
        ),
      ),
    );
  }
}