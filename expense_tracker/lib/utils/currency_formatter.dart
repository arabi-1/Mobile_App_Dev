/// The currency symbol used by expense inputs and formatted amounts.
const currencySymbol = 'Rs';

/// Formats a numeric amount or preserves a supplied amount string for display.
/// Numeric values are rounded to zero decimal places; strings are not parsed
/// or validated. [suffix] is appended unchanged.
String formatRupees(Object amount, {String suffix = ''}) {
  final value = amount is num ? amount.toStringAsFixed(0) : amount.toString();
  return '$currencySymbol $value$suffix';
}
