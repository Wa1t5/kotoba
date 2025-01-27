import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kotoba/widgets/kanji_meaning.widget.dart';
import 'package:kanji_dictionary/kanji_dictionary.dart';

String extractKanji(String input) {
  final kanjiRegex = RegExp(r'[\u4E00-\u9FFF\u3400-\u4DBF\uF900-\uFAFF]');
  
  final kanjiMatches = kanjiRegex.allMatches(input);
  
  final kanjiCharacters = kanjiMatches.map((match) => match.group(0)).join();
  
  return kanjiCharacters;
}

String extractUniqueKanji(String input) {
  final kanjiRegex = RegExp(r'[\u4E00-\u9FFF\u3400-\u4DBF\uF900-\uFAFF]');
  
  final kanjiMatches = kanjiRegex.allMatches(input);
  
  final kanjiCharacters = kanjiMatches
      .map((match) => match.group(0))
      .whereType<String>()
      .toSet()
      .join();
  
  return kanjiCharacters;
}

Future<Character> getKanjiInfo(String kanji) async {
  final kanjiDic = await KanjiDictionary.instance;
  final Character char = kanjiDic.get(kanji)!;
  return Future(() => char);
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

String getSVGPath(String kanji) {
  int codePoint = kanji.runes.first; // Get the Unicode code point
  String filename = "assets/kanjivg/kanji/0${codePoint.toRadixString(16)}.svg"; 
  return filename;
}

Future<String> getKanjiVGFileAsString(String kanji) async {
  int codePoint = kanji.runes.first; // Get the Unicode code point
  String filename = "assets/kanjivg/kanji/0${codePoint.toRadixString(16)}.svg"; 
  String svgContent = await rootBundle.loadString(filename);
  return svgContent;
}