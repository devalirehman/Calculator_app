import 'package:flutter/material.dart';
import '../main.dart';

class FirstCardScreen extends StatefulWidget {
  final String input;
  final String output;

  const FirstCardScreen({
    super.key,
    required this.input,
    required this.output,
  });

  @override
  State<FirstCardScreen> createState() => FirstCardScreenState();
}

class FirstCardScreenState extends State<FirstCardScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 345,
      width: 390,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.secondary,
          ],
        ),
        border: Border.all(color: theme.colorScheme.surfaceDim),
      ),
      child: Column(
        children: [

          // 🔝 TOP BAR
          Container(
            height: 60,
            width: 389,
            decoration: BoxDecoration(
              color: theme.colorScheme.surface.withOpacity(0.6),
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: theme.colorScheme.outline),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                GestureDetector(
                  onTap: () {
                    MyApp.of(context)?.toggleTheme();
                  },
                  child: Container(
                    height: 50,
                    width: 40,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: theme.colorScheme.surfaceDim),
                    ),
                    child: Icon(Icons.wb_sunny_outlined),
                  ),
                ),

                Container(
                  height: 50,
                  width: 40,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: theme.colorScheme.surfaceDim),
                  ),
                  child: Icon(Icons.history),
                ),
              ],
            ),
          ),

          // 🔢 DISPLAY
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  Text(
                    widget.input,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.output,
                    style: const TextStyle(
                      fontSize: 67,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}