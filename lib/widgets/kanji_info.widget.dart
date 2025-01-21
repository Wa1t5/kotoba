import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unofficial_jisho_api/api.dart' as jisho;
import 'package:kotoba/utils/web_utils.utils.dart';


class KanjiInfo extends StatelessWidget {
  final jisho.KanjiResult kanji;

  const KanjiInfo(this.kanji, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //${kanji.data?.strokeOrderGifUri}
        SvgPicture.network("${kanji.data?.strokeOrderSvgUri}", height: 200),
        Divider(),
        Text("Stroke Count: ${kanji.data?.strokeCount}", style: TextStyle(fontSize:  30)),
        Divider(),
        Text("Meanings: ${kanji.data?.meaning}", style: TextStyle(fontSize:  30)),
        Divider(),
        Text("Kun: ${kanji.data?.kunyomi}", style: TextStyle(fontSize:  30)),
        Text("On: ${kanji.data?.onyomi}", style: TextStyle(fontSize:  30)),
        Divider(),
        Text("Grade: ${kanji.data?.taughtIn}", style: TextStyle(fontSize:  30)),
        Text("JLPT Level: ${kanji.data?.jlptLevel}", style: TextStyle(fontSize:  30)),
        Divider(),
        RichText(text: 
          TextSpan(
            text: "Open In Jisho", 
            style: TextStyle(fontSize:  30, 
            color: Theme.of(context).colorScheme.secondary),
            recognizer: TapGestureRecognizer() 
              ..onTap = () { launchLink("${kanji.data?.uri}"); }
            
          )
        ),
      ],
    );
  }
}