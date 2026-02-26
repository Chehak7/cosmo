import 'package:flutter_test/flutter_test.dart';
import 'package:cosmo/main.dart';
import 'package:cosmo/screens/auth_screen.dart';

void main() {
  testWidgets('Auth screen displays COSMO brand', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CosmoApp());

    // Verify that the brand name is displayed.
    expect(find.text('COSMO'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);
    expect(find.text('SIGN UP'), findsOneWidget);
  });
}
