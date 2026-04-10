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

    List<String> buttons = [
      "C", "+/-", "%", "/",
      "7", "8", "9", "*",
      "4", "5", "6", "-",
      "1", "2", "3", "+",
      "0", ".", "="
    ];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
            top: Radius.circular(27)),
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.secondary,
          ],
        ),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: GridView.builder(
        padding: const EdgeInsets.all(09),
        itemCount: buttons.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              widget.onTap(buttons[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black87.withOpacity(0.1),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Center(
                child: Text(
                  buttons[index],
                  style: const TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.w700,
                  )
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}