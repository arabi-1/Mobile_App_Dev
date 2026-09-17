/// Responsibility: format expense amounts for the app's rupee display.
/// Public contract: [formatRupees] accepts a number or amount string and an
/// optional suffix.
/// Boundary: does not validate input, store state, or render widgets.
String formatRupees(Object amount, {String suffix = ''}) {
  final value = amount is num ? amount.toStringAsFixed(0) : amount.toString();
  return 'Rs $value$suffix';
}
