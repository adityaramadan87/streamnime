import 'dart:developer';

class ObjectUtils {
  static void printWrapped(String text, String name) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach(
        (match) => log(match.group(0)!, name: name, time: DateTime.now()));
  }
}
