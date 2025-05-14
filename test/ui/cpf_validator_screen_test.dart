

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:validador_cpf/ui/cpf_validator_screen.dart';

void main() {
  group('CpfValidatorScreen', () {
    testWidgets('exibe título, campo de entrada numérica e botão', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CpfValidatorScreen(),
        ),
      );

      expect(find.text('Validador de CPF'), findsOneWidget);

      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);

      TextField tf = tester.widget(textField);
      expect(tf.keyboardType, TextInputType.number);

      expect(find.widgetWithText(ElevatedButton, 'validar'), findsOneWidget);
    });

    testWidgets('mostra "CPF válido ✅" para um CPF válido', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CpfValidatorScreen(),
        ),
      );

      await tester.enterText(find.byType(TextField), '12345678909');
      await tester.tap(find.widgetWithText(ElevatedButton, 'validar'));
      await tester.pumpAndSettle();

      expect(find.text('CPF válido ✅'), findsOneWidget);
      expect(find.text('CPF inválido ❌'), findsNothing);
    });

    testWidgets('mostra "CPF inválido ❌" para um CPF inválido', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CpfValidatorScreen(),
        ),
      );

      await tester.enterText(find.byType(TextField), '11111111111');
      await tester.tap(find.widgetWithText(ElevatedButton, 'validar'));
      await tester.pumpAndSettle();

      expect(find.text('CPF inválido ❌'), findsOneWidget);
      expect(find.text('CPF válido ✅'), findsNothing);
    });
  });
}