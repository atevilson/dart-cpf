
import 'package:flutter/material.dart';
import 'package:validador_cpf/ui/cpf_validator_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CpfValidatorScreen(),
    );
  }
}
