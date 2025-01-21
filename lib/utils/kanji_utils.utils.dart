import 'package:flutter/material.dart';
import 'package:kotoba/widgets/kanji_meaning.widget.dart';
import 'package:unofficial_jisho_api/api.dart' as jisho;


String extractKanji(String input) {
  // Define a regular expression to match kanji characters
  final kanjiRegex = RegExp(r'[\u4E00-\u9FFF\u3400-\u4DBF\uF900-\uFAFF]');
  
  // Use the regex to find all matches in the input string
  final kanjiMatches = kanjiRegex.allMatches(input);
  
  // Extract the kanji characters from the matches
  final kanjiCharacters = kanjiMatches.map((match) => match.group(0)).join();
  
  return kanjiCharacters;
}

Future<jisho.KanjiResult> getKanjiInfo(String kanji) async {
  final jisho.KanjiResult result = await jisho.searchForKanji(kanji);
  return Future(() => result);
}

ListView genKanjiRow(String kanjis) {
  //List<Row> tempKanjiRow = List.empty(growable: true);
  List<KanjiMeaningWidget> tempKanjiWidgetList = List.empty(growable: true);


  kanjis.runes.forEach((c) {
    String char = String.fromCharCode(c);
    tempKanjiWidgetList.add(KanjiMeaningWidget(char));
  });
    
  return ListView(children: tempKanjiWidgetList);
}