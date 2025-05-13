import 'package:test/test.dart';

import '../lib/cpf_validate.dart';

void main(){
  late CpfValidate cpfValidator;
  setUp(() => cpfValidator = CpfValidate());

  group("Cpf válido", (){
    test("Deve validar um CPF formatado corretamente", (){
      final isValid = cpfValidator.validate("935.411.347-80");
      expect(isValid, isTrue);
    });

    test("Deve validar um CPF sem formatação", () {
      final isValid = cpfValidator.validate("35718837805");
      expect(isValid, isTrue);
    });
    
    test("Deve validar um CPF com dígitos de verificação incomuns, mas válidos", () {
      final isValid = cpfValidator.validate("987.654.321-00");
      expect(isValid, isTrue);
    });
  });

  group("Cpf inválido", (){
    test("Deve rejeitar CPF com todos os mesmos dígitos", () {
      expect(cpfValidator.validate("111.111.111-11"), isFalse);
    });

    test("Deve rejeitar CPF com dígitos de verificação inválidos", () {
      expect(cpfValidator.validate("123.456.789-10"), isFalse);
    });
    
    test("Deve rejeitar CPF com mais de 11 dígitos", () {
      expect(cpfValidator.validate("123.456.789-100000"), isFalse);
    });
    
    test("Deve rejeitar CPF com menos de 11 dígitos", () {
      expect(cpfValidator.validate("123456789"), isFalse);
    });
    
    test("Deve rejeitar CPF vazio", () {
      expect(cpfValidator.validate(""), isFalse);
    });
    
    test("Deve rejeitar CPF nulo", () {
      expect(cpfValidator.validate(null), isFalse);
    });
    
    test("Deve rejeitar CPF com caracteres não numéricos", () {
      expect(cpfValidator.validate("AAA.BBB.CCC-DD"), isFalse);
    });
  });
}