extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  dynamic capsLock() {
    if (this != null)
      return this[0].toUpperCase() + this.substring(1);
    else
      return null;
  }
}
