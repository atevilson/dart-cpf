
import 'package:flutter/material.dart';

class CpfValidatorScreen extends StatefulWidget{
  const CpfValidatorScreen({super.key});

  @override
  State<CpfValidatorScreen> createState() => _CpfValidatorScreenState();
}

class _CpfValidatorScreenState extends State<CpfValidatorScreen> {
  late final TextEditingController _controller = TextEditingController();
  late final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool _isEnabled = false;

  // strings fixas
  final String _validadorCpf = "Validador de CPF";
  final String _validar = "validar";
  final String _insiraCpf = "Insira o cpf";

  @override 
  void initState(){
    _focusNode.addListener((){
      setState(() {
        _isFocused = _focusNode.hasFocus;
        _isEnabled = _focusNode.hasFocus;
      });
    });
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
                color: _isEnabled ? Colors.green : Colors.black54,
                fontWeight: FontWeight.w500
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                focusNode: _focusNode,
                enabled: true,
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: _getDecorationInput()
              ),
            ),
            ElevatedButton(onPressed: () => {}, 
            style: ElevatedButton.styleFrom(
              backgroundColor: _isEnabled ? Colors.green : Colors.black54,
              foregroundColor: Colors.white
            ), child: Text(_validar))
          ],
        ),
      ),
    );
  }
  
  Color _getLabelColor() {

    if (!_isEnabled) {
      return Colors.grey;
    } else if (_isFocused) {
      return Colors.green;
    } 
    return Colors.transparent;
  }

  InputDecoration _getDecorationInput(){
   return InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.5),
          borderSide: BorderSide(color: Colors.black54)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.5),
          borderSide: BorderSide(color: Colors.green)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.5),
          borderSide: BorderSide(color: Colors.red)),
      labelText: _insiraCpf,
      labelStyle: TextStyle(color: _getLabelColor())
   );
  }
}