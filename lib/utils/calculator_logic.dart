class CalculatorLogic {
  String input = "";
  String output = "0";

  double num1 = 0;
  String operator = "";

  bool isNewNumber = false;

  void onButtonClick(String value) {
    if (value == "C") {
      clear();
    }
    else if (isOperator(value)) {
      setOperator(value);
    }
    else if (value == "=") {
      // optional (already live hai)
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

    // 🔥 LIVE CALCULATION
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

    // 🔥 FORMAT RESULT (NO .0 ISSUE)
    output = formatResult(result);
  }

  // ✅ IMPORTANT FUNCTION
  String formatResult(double value) {
    if (value % 1 == 0) {
      return value.toInt().toString(); // 5.0 → 5
    } else {
      return value.toString(); // 5.5 → 5.5
    }
  }

  bool isOperator(String value) {
    return ["+", "-", "*", "/"].contains(value);
  }
}