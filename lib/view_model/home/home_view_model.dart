import 'package:flutter/foundation.dart';

class HomeViewModel with ChangeNotifier {
  String displayText = "0";
  String currentInput = "";
  String selectedOperator = "";
  double firstOperand = 0;
  double secondOperand = 0;

  void onButtonPressed(String buttonText) {
    if (buttonText == "C") {
      clearAll();
    } else if (isOperator(buttonText)) {
      firstOperand = double.parse(displayText);
      selectedOperator = buttonText;
      currentInput = "";
    } else if (buttonText == "=") {
      secondOperand = double.parse(displayText);
      calculateResult();
    } else {
      if (currentInput.length < 10) {
        currentInput += buttonText;
        displayText = currentInput;
      }
    }
    notifyListeners();
  }

  bool isOperator(String buttonText) {
    return buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "×" ||
        buttonText == "÷";
  }

  void clearAll() {
    displayText = "0";
    currentInput = "";
    selectedOperator = "";
    firstOperand = 0;
    secondOperand = 0;
  }

  void calculateResult() {
    switch (selectedOperator) {
      case "+":
        displayText = (firstOperand + secondOperand).toString();
        break;
      case "-":
        displayText = (firstOperand - secondOperand).toString();
        break;
      case "×":
        displayText = (firstOperand * secondOperand).toString();
        break;
      case "÷":
        displayText = (firstOperand / secondOperand).toString();
        break;
      default:
        displayText = "Error";
    }
    resetAfterCalculation();
  }

  void resetAfterCalculation() {
    currentInput = "";
    selectedOperator = "";
    firstOperand = 0;
    secondOperand = 0;
  }
}
