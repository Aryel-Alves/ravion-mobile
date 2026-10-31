import 'package:flutter_test/flutter_test.dart';

import 'package:ravion_mobile/app/ravion_app.dart';

void main() {
  testWidgets('renders entry screen', (WidgetTester tester) async {
    await tester.pumpWidget(const RavionApp());

    expect(find.text('Ravion'), findsOneWidget);
    expect(find.text('Continuar'), findsOneWidget);
    expect(find.text('Confirmo que tenho 18 anos ou mais'), findsOneWidget);
  });
}
