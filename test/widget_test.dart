import 'package:flutter_test/flutter_test.dart';

import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

void main() {
  testWidgets('Menu page shows info cards and SnackBar on tap', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MyApp(apiClient: ApiClient()));

    expect(find.text('M. Naufal Abyaz Bawono'), findsOneWidget);
    expect(find.text('Lihat Proyek'), findsOneWidget);

    await tester.tap(find.text('Tambah Pengalaman'));
    await tester.pump();

    expect(
      find.text('Kamu telah menekan tombol Tambah Pengalaman!'),
      findsOneWidget,
    );
  });
}
