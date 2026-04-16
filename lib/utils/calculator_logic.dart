class HistoryItem {
  final String expression;
  final String result;

  HistoryItem({required this.expression, required this.result});
}

class CalculatorLogic {
  String input = "";
  String output = "0";

  double num1 = 0;
  String operator = "";

  bool isNewNumber = false;

  List<HistoryItem> history = []; // ✅ NEW

  void onButtonClick(String value) {
    if (value == "C") {
      clear();
    }

    else if (value == "⌫") {
      backspace();
    }

    else if (isOperator(value)) {
      setOperator(value);
    }

    else if (value == "=") {
      calculateFinal(); // ✅ NEW
    }

    else {
      appendNumber(value);
    }
  }

  void clear() {
    input = "";
    output = "0";
    num1 = 0;
    operator = "";
    isNewNumber = false;
  }

  void clearHistory() {
    history.clear();
  }

  void backspace() {
    if (output.isNotEmpty && output != "0") {
      output = output.substring(0, output.length - 1);

      if (output.isEmpty) {
        output = "0";
      }
    }

    if (input.isNotEmpty) {
      input = input.substring(0, input.length - 1);
    }
  }

  void appendNumber(String value) {
    if (isNewNumber) {
      output = value;
      isNewNumber = false;
    } else {
      if (output == "0") {
        output = value;
      } else {
        output += value;
      }
    }

    input += value;

    if (operator.isNotEmpty) {
      calculateLive();
    }
  }

  void setOperator(String op) {
    num1 = double.tryParse(output) ?? 0;
    operator = op;

    input += " $op ";
    isNewNumber = true;
  }

  void calculateLive() {
    double num2 = double.tryParse(output) ?? 0;

    double result = 0;

    if (operator == "+") {
      result = num1 + num2;
    } else if (operator == "-") {
      result = num1 - num2;
    } else if (operator == "*") {
      result = num1 * num2;
    } else if (operator == "/") {
      result = num1 / num2;
    }

    output = formatResult(result);
  }

  void calculateFinal() {
    // ✅ already calculated value use karo
    String finalResult = output;

    // ✅ save history
    history.add(
      HistoryItem(
        expression: input,
        result: finalResult,
      ),
    );

    input = finalResult;
    output = finalResult;

    operator = ""; // 🔥 reset operator
    num1 = double.tryParse(finalResult) ?? 0;

    isNewNumber = true;
  }

  String formatResult(double value) {
    if (value % 1 == 0) {
      return value.toInt().toString();
    } else {
      return value.toString();
    }
  }

  bool isOperator(String value) {
    return ["+", "-", "*", "/"].contains(value);
  }
}