import 'package:flutter_test/flutter_test.dart';

import 'package:myportofolio_mobile/main.dart';

void main() {
  testWidgets('Menu page shows info cards and SnackBar on tap',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Burhan'), findsOneWidget);
    expect(find.text('Lihat Proyek'), findsOneWidget);

    await tester.tap(find.text('Lihat Proyek'));
    await tester.pump();

    expect(find.text('Kamu telah menekan tombol Lihat Proyek!'), findsOneWidget);
  });
}
