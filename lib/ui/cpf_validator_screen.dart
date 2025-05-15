
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validador_cpf/cpf_validate.dart';

class CpfValidatorScreen extends StatefulWidget{
  const CpfValidatorScreen({super.key});

  @override
  State<CpfValidatorScreen> createState() => _CpfValidatorScreenState();
}

class _CpfValidatorScreenState extends State<CpfValidatorScreen> {
  late final TextEditingController _controller = TextEditingController();
  late final FocusNode _focusNode = FocusNode();
  late ConfettiController _confettiController;
  bool _isFocused = false;
  bool _isEnabled = false;
  String? _validateCpf;

  // strings fixas
  final String _validadorCpf = "Validador de CPF";
  final String _validar = "validar";
  final String _insiraCpf = "Insira o cpf";
  final String _cpfValido = "CPF válido";
  final String _cpfInvalido = "CPF inválido";

  @override 
  void initState(){
    _focusNode.addListener((){
      setState(() {
        _isFocused = _focusNode.hasFocus;
        _isEnabled = _focusNode.hasFocus;
      });
    });

    _confettiController = ConfettiController(duration: const Duration(seconds: 2));

    super.initState();
  }

  @override 
  void dispose(){
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
    _confettiController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SizedBox.expand(
        child: Stack(alignment: Alignment.topCenter, children: [
          Padding(
            padding: const EdgeInsets.only(top: 350.0),
            child: Column(
              children: [
                Text(
                  _validadorCpf,
                  style: TextStyle(
                      fontSize: 20,
                      color: _isEnabled
                          ? Colors.green
                          : const Color.fromARGB(255, 53, 100, 0),
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      _formatCpf()
                    ],
                    focusNode: _focusNode,
                    enabled: true,
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: _getDecorationInput(),
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                ElevatedButton(
                    onPressed: () => _getValidatedCpf(),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: _isEnabled
                            ? Colors.green
                            : const Color.fromARGB(255, 53, 100, 0),
                        foregroundColor: Colors.white),
                    child: Text(_validar)),
                if (_validateCpf != null)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      _validateCpf ?? "",
                      style: TextStyle(
                          color: _validateCpf!.contains("✅")
                              ? Colors.green
                              : Colors.red,
                          fontSize: 23.0),
                    ),
                  )
              ],
            ),
          ),
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            emissionFrequency: 0.05,
            numberOfParticles: 10,
            maxBlastForce: 30,
            gravity: 0.2,)
        ]),
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
          borderSide: BorderSide(color: const Color.fromARGB(255, 53, 100, 0))),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.5),
          borderSide: BorderSide(color: Colors.green)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.5),
          borderSide: BorderSide(color: Colors.red)),
      labelText: _insiraCpf,
      labelStyle: TextStyle(color: _getLabelColor()),
   );
  }

   MaskTextInputFormatter _formatCpf(){
    return MaskTextInputFormatter(
      mask: "###.###.###-##",
      filter: {"#": RegExp(r"[0-9]")}
    );
  }

  void _getValidatedCpf() {
    final cpf = _controller.text;
    final isValid = CpfValidate().validate(cpf);
    setState(() {
      _validateCpf = isValid ? "$_cpfValido ✅" : "$_cpfInvalido ❌";
    });
    if(isValid) _confettiController.play();
  }
}