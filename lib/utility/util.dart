class Util {
  static String toNumericFormat(String string) {
    if (string == null) return '0';
    return string.replaceAllMapped(
        new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }
}
