import 'package:flutter/material.dart';
import 'package:kotoba/routes/kanji_grid.route.dart';
import 'package:kotoba/utils/kanji_utils.utils.dart';

String textToAnalyze = "";

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kotoba",
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
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
            ElevatedButton(child: Text("Scan"), onPressed: () {
              Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => KanjiGrid(genKanjiRow(extractKanji(textToAnalyze)))));
              }
            )
          ]
        ),
      );
  }
}