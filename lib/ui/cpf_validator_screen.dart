
import 'package:flutter/material.dart';

class CpfValidatorScreen extends StatefulWidget{
  const CpfValidatorScreen({super.key});

  @override
  State<CpfValidatorScreen> createState() => _CpfValidatorScreenState();
}

class _CpfValidatorScreenState extends State<CpfValidatorScreen> {
  late TextEditingController _controller = TextEditingController();

  // strings fixas
  final String _validadorCpf = "Validador de CPF";
  final String _validar = "validar";
  final String _insiraCpf = "Insira o cpf";

  @override 
  void initState(){
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 350.0),
        child: Column(
          children: [
            Text(
              _validadorCpf,
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
                fontWeight: FontWeight.w500
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: _insiraCpf,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.5)
                  )
                ),
              ),
            ),
            ElevatedButton(onPressed: null, child: Text(_validar))
          ],
        ),
      ),
    );
  }
}