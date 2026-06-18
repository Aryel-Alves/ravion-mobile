import 'package:flutter_test/flutter_test.dart';

import 'package:ravion_mobile/app/ravion_app.dart';

void main() {
  testWidgets('renders shell title', (WidgetTester tester) async {
    await tester.pumpWidget(const RavionApp());

    expect(find.text('Ravion'), findsOneWidget);
    expect(
      find.text('Base da Onda 0: navegacao + tokens aplicada.'),
      findsOneWidget,
    );
  });
}
