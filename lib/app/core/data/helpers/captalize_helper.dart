///? Deals with captalizing strings
class CaptalizeHelper {
  /// Captalizes the first letter of the first word
  static String captalize(String text) {
    if (text.isNotEmpty) {
      return '${text[0].toUpperCase()}${text.substring(1)}';
    }
    return text;
  }

  /// Captalizes the first letter of all words
  static String captalizeAll(String text) {
    if (text.isNotEmpty) {
      return text.split(' ').map((word) => captalize(word)).join(' ');
    }
    return text;
  }
}
