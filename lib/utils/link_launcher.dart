import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkLauncher {
  static void open(String urlString) async {
    if (!await launch(urlString)) {
      Fluttertoast.showToast(msg: "Cannot launch $urlString");
    }
  }
}
