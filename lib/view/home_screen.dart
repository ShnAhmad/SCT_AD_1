import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sct_ad_1/view_model/home/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var calculaterpovider = Provider.of<HomeViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Calculator')),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Consumer<HomeViewModel>(
              builder: (context, value, chiled) => Text(
                value.displayText,
                style: const TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: [
                  _buildButton(
                      calculaterpovider, "7", Colors.grey[300]!, Colors.black),
                  _buildButton(
                      calculaterpovider, "8", Colors.grey[300]!, Colors.black),
                  _buildButton(
                      calculaterpovider, "9", Colors.grey[300]!, Colors.black),
                  _buildButton(
                      calculaterpovider, "÷", Colors.orange, Colors.white),
                ],
              ),
              Row(
                children: [
                  _buildButton(
                      calculaterpovider, "4", Colors.grey[300]!, Colors.black),
                  _buildButton(
                      calculaterpovider, "5", Colors.grey[300]!, Colors.black),
                  _buildButton(
                      calculaterpovider, "6", Colors.grey[300]!, Colors.black),
                  _buildButton(
                      calculaterpovider, "×", Colors.orange, Colors.white),
                ],
              ),
              Row(
                children: [
                  _buildButton(
                      calculaterpovider, "1", Colors.grey[300]!, Colors.black),
                  _buildButton(
                      calculaterpovider, "2", Colors.grey[300]!, Colors.black),
                  _buildButton(
                      calculaterpovider, "3", Colors.grey[300]!, Colors.black),
                  _buildButton(
                      calculaterpovider, "-", Colors.orange, Colors.white),
                ],
              ),
              Row(
                children: [
                  _buildButton(
                      calculaterpovider, "C", Colors.red, Colors.white),
                  _buildButton(
                      calculaterpovider, "0", Colors.grey[300]!, Colors.black),
                  _buildButton(
                      calculaterpovider, "=", Colors.orange, Colors.white),
                  _buildButton(
                      calculaterpovider, "+", Colors.orange, Colors.white),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

_buildButton(
    calculaterpovider, String buttonText, Color buttonColor, Color textColor) {
  return Expanded(
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          padding: const EdgeInsets.all(24.0),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        onPressed: () {
          calculaterpovider.onButtonPressed(calculaterpovider.displayText);
        }),
  );
}
