import 'package:flutter/material.dart';

class SecondCardScreen extends StatefulWidget {
  final Function(String) onTap;

  const SecondCardScreen({super.key, required this.onTap});

  @override
  State<SecondCardScreen> createState() => SecondCardScreenState();
}

class SecondCardScreenState extends State<SecondCardScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(06)),
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.secondary,
          ],
        ),
        border: Border.all(color: theme.colorScheme.outline),
      ),

      child: Column(
        children: [

          buildRow(["C", "⌫", "%", "/"]),
          buildRow(["7", "8", "9", "*"]),
          buildRow(["4", "5", "6", "-"]),
          buildRow(["1", "2", "3", "+"]),
          buildLastRow(),

        ],
      ),
    );
  }

  Widget buildRow(List<String> rowButtons) {
    return Expanded(
      child: Row(
        children: rowButtons.map((text) {
          return Expanded(
            child: buildButton(text),
          );
        }).toList(),
      ),
    );
  }

  Widget buildButton(String text) {
    return Padding(
      padding: const EdgeInsets.all(06),
      child: ElevatedButton(
        onPressed: () {
          widget.onTap(text);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: getButtonColor(text),
          minimumSize: Size(30, 95),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildLastRow() {
    return Expanded(
      child: Row(
        children: [
          Expanded(flex: 2, child: buildButton("0")),
          Expanded(child: buildButton(".")),
          Expanded(child: buildButton("=")),
        ],
      ),
    );
  }

  Color getButtonColor(String text) {
    if (text == "C") {
      return Colors.red;
    } else if (text == "⌫") {
      return Colors.orange; // 🔥 new color
    } else if (text == "=") {
      return Colors.green;
    } else if (["/", "*", "-", "+", "%"].contains(text)) {
      return Colors.orange;
    } else {
      return Colors.grey.shade700;
    }
  }}