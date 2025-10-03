extension DoubleExt on double {
  String toFormattedString() {
    return this % 1 == 0 ? toInt().toString() : toString();
  }
}
