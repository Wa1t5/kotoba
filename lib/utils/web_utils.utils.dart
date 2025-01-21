import 'package:url_launcher/url_launcher.dart';

Future<void> launchLink(String url) {
  launchUrl(Uri.parse(url));
  return Future(() => null);
}