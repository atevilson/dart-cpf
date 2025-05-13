class CpfValidate{

  static const _firstDigitFactor = 10;
  static const _secondeDigitFactor = 11;
  
  bool validate(String? cpf){
    if (cpf == null || cpf.isEmpty)  return false;
    final cleanedCpf = _removeCpfFormmating(cpf);
    if (!_hasValidLenght(cleanedCpf)) return false;
    if (_hasAllSameDigits(cleanedCpf)) return false;
    final int firstDigit = _calculateDigit(cleanedCpf, _firstDigitFactor);
    final int secondDigit = _calculateDigit(cleanedCpf, _secondeDigitFactor);
    String actualDigit = cleanedCpf.substring(9);
    final calculatedDigit = "$firstDigit$secondDigit";
    return actualDigit == calculatedDigit;
  }

  String _removeCpfFormmating(cpf){
    return cpf.replaceAll(RegExp(r'\D'), "");
  }

  bool _hasValidLenght(cpf){
    return cpf.length == 11;
  }

  bool _hasAllSameDigits(String cpf){
    final firstDigit = cpf[0];
    return cpf.split("").every((digit) => digit == firstDigit);
  }

  int _calculateDigit(String cpf, int factor){
    int total = 0;
    for (var digit in cpf.split("")){
      if(factor > 1) total += int.parse(digit) * factor--;
    }
    final rest = total % 11;
    return rest < 2 ? 0 : 11 - rest;
  }
}