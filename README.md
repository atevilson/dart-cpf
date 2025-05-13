# 📋 **Validador de CPF**

Um algoritmo matemático com boas práticas de programação.

---

## 🛡️ **O que contêm nesse algmoritmo validador?** 

- **Precisão:** Implementa o [algoritmo oficial da Receita Federal](https://macoratti.net/alg_cpf.htm).  
- **Cobertura de testes:** Testado com os cenários de (CPFs inválidos, formatos inválidos, digitos iguais, com mais ou menos e 11 digitos, etc...)  
- **Clareza:** Código organizado, métodos auxiliares por respnsabilidades distintas.  

---

## 🔍 **Funcionalidades Principais**  

### 1. `validate(String? cpf)`  

**O que faz?**  

É o método ```base``` do validador. Centraliza todas as verificações, ex:  

- Remove formatação (`.` e `-`).  
- Bloqueia CPFs falsos (todos dígitos iguais, tamanho errado).  
- Calcula dígitos verificadores.  

**Por que importa?**  

É como um **checklist de segurança**: só aprova CPFs que passam por todas as etapas!  

---

### 2. `_removeCpfFormatting(cpf)`  

**O que faz?**  

Transforma `123.456.789-09` em `12345678909`.  

**Por que importa?**:  

Remove tudo que não é número, garantindo que o algoritmo trabalhe com dados limpos.  

---

### 3. `_hasValidLength(cpf)`  

**O que faz?**  

Garante que o CPF tem **exatamente 11 dígitos**.  

**Por que é crucial?**  

Um CPF com 12 dígitos é tão inválido quanto um número de telefone com 9 dígitos. Esta função é o "trena digital" do sistema.  

---

### 4. `_hasAllSameDigits(cpf)`  

**O que faz?**  

Detecta CPFs como `111.111.111-11` (que são inválidos por regra).  

**Curiosidade:**  

Essa verificação evita que fraudadores usem sequências óbvias para burlar sistemas.  

---

### 5. `_calculateDigit(cpf, factor)`  
**O que faz?**  
Calcula os dígitos verificadores, seguindo a regra oficial.  

**Exemplo:**  
Para `123.456.789`, calcula se os dígitos finais devem ser `09` ou `05`, por exemplo.  

---

## 🧪 **Ex de Teste de unidade (_hasAllSameDigits)**:
 
```dart  
test("Deve rejeitar CPF com todos os dígitos iguais", () {  
  expect(validator.validate("111.111.111-11"), isFalse);  
});  
```

### 🛠️ Por que usar a cobertura de testes?

Pense em um quebra-cabeça, a cobertura de testes é como verificar peça por peça:

- ✅ Se faltam peças (partes do código não testadas), o resultado final ficará incompleto.
- ✅ Se todas as peças se encaixam (código passa no teste), você sabe que o quebra-cabeça está correto.

---

No código:

- validate testado = Certeza de que validações críticas funcionam.

- _calculateDigit testado = Dígitos sempre calculados corretamente.


```bash
# comando para gerar relatório de cobertura (exemplo usando a linguagem Dart):  
genhtml -o coverage_report lcov.info
```

---

## **Benefícios**:

- 🚀 **Menos bugs em produção** (evita dor de cabeça para usuários).
- 💡 **Documentação** (os testes mostram como o código deve ser usado).

- 📢 **Conclusão**: Este projeto não é só um validador de CPF é um exemplo de como testes robustos elevam a qualidade do software.

---

### Juntos, podemos construir software tão confiável quanto um relógio suíço! ⏱️💻

### Nesse README busquei abordar explicações técnicas com analogias, para tornar o código mais compreensível e ressaltar a cultura de testes. O que me diz? 😊

---

### Autor

---
 <sub><b>Atevilson Freitas</b></sub></a> <a href="">🧑‍💻</a>