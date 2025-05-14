
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:validador_cpf/ui/cpf_validator_screen.dart';

void main(){
  bool isWeb = kIsWeb;
  runApp(isWeb ? DevicePreview(
          builder: (context) => const MyApp(),
          enabled: true,
          tools: const [
            DeviceSection(),
          ],
        ) : const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: Colors.green,
          cursorColor: Colors.green,
          selectionColor: Colors.green
        ),
        useMaterial3: true
      ),
      home: CpfValidatorScreen(),
    );
  }
}
