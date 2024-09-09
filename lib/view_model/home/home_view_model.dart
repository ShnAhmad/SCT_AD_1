import 'package:flutter/foundation.dart';

class HomeViewModel with ChangeNotifier {
  // Displayed output on the calculator screen
  String displayText = "0";
  String currentInput = ""; // Current input number
  String selectedOperator = ""; // Currently selected operator
  double firstOperand = 0; // First number in the operation
  double secondOperand = 0; // Second number in the operation

  // Handles button presses
  void onButtonPressed(String buttonText) {
    if (buttonText == "C") {
      clearAll();
    } else if (isOperator(buttonText)) {
      firstOperand = double.parse(displayText);
      selectedOperator = buttonText;
      currentInput = "";
    } else if (buttonText == "=") {
      // When "=" is pressed, perform the calculation
      secondOperand = double.parse(displayText);
      calculateResult();
    } else {
      // Handle number or dot input
      if (currentInput.length < 10) {
        currentInput += buttonText;
        displayText = currentInput;
        // Update the display with the new input
      }
    }
    notifyListeners();
  }

  // Check if a button is an operator
  bool isOperator(String buttonText) {
    return buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "×" ||
        buttonText == "÷";
  }

  // Clear all values
  void clearAll() {
    displayText = "0";
    currentInput = "";
    selectedOperator = "";
    firstOperand = 0;
    secondOperand = 0;
  }

  // Perform the calculation based on the selected operator
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
    // Reset after calculation
    resetAfterCalculation();
  }

  // Reset the input and operator after a calculation
  void resetAfterCalculation() {
    currentInput = "";
    selectedOperator = "";
    firstOperand = 0;
    secondOperand = 0;
  }
}
