import 'package:flutter/material.dart';
import 'package:kanji_dictionary/kanji_dictionary.dart';
import 'package:kotoba/routes/kanji_grid.route.dart';
import 'package:kotoba/utils/kanji_utils.utils.dart';
import 'package:kotoba/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kotoba",
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home:HomeScreen()
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Kotoba")),
        body: ListView(
          children: 
          [
            TextField(
              maxLines: 20,
              minLines: 1,
              onChanged: (value) {
                textToAnalyze = value;
              }
            ),
            ElevatedButton(child: Text(AppLocalizations.of(context)!.scanButton), onPressed: () {

              // Define kanji dic language
              if (AppLocalizations.of(context)!.localeName == "pt") {
                kanjiDicLang = Language.portuguese;
              } else {
                kanjiDicLang = Language.english;
              }

              Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => KanjiGrid(genKanjiRow(extractKanji(textToAnalyze))))
              );
              }
            )
          ]
        ),
      );
  }
}