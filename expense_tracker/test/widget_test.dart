import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/state/expense_data.dart';

void main() {
  testWidgets('displays the initial expense dashboard', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ExpenseData(),
        child: const MyApp(),
      ),
    );

    expect(find.text('Track your expenses'), findsOneWidget);
    expect(find.text('Total: Rs 703'), findsOneWidget);
    expect(find.text('Pet Care'), findsOneWidget);
  });
}
