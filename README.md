<h1 style="text-align:center"> 言葉 </h1>

言葉(kotoba) Is a simple and hacky kanji extractor that I wrote in the necessity of
an app that could extract kanji from songs or texts, and get the individual meanings
instead of focusing on the phrases.
This is by no means a final or polished product, contributions are accepted,
but keep in mind that this app is just a prototype

<h2 style="text-align:center"> How It Works </h2>
I just iterate over each character in the string
and use a regex expresison to evaluate if given char is in the kanji unicode system, then I use the jisho.org api to get the related kanji data

<h2 style="text-align:center"> Screenshots </h2>

![Alt text](./readme_assets/screenshot1.png)
![Alt text](./readme_assets/screenshot2.png)
![Alt text](./readme_assets/screenshot3.png)


<h2 style="text-align:center"> Libraries </h2>

* [Unofficial Jisho API](pub.dev/packages/unofficial_jisho_api)
* [Flutter SVG](https://pub.dev/packages/flutter_svg)
* [Kanji Dictionary(I'm planning to use it later)](https://pub.dev/packages/kanji_dictionary)
* [Japanese Word Tokenizer(I'm planning to use it later)](https://pub.dev/packages/japanese_word_tokenizer)
* [Url launcher](https://pub.dev/packages/url_launcher)



