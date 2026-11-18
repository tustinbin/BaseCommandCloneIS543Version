import 'package:flutter_test/flutter_test.dart';

import 'package:base_command/app.dart';

void main() {
  testWidgets('Access screen shows enter control', (tester) async {
    await tester.pumpWidget(const BaseCommandApp());
    expect(find.text('ENTER BASE'), findsOneWidget);
  });
}
