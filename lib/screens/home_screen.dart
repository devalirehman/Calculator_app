import 'package:digital_calculator/widgets/firstcard_screen.dart';
import 'package:digital_calculator/widgets/secoundcard_screen.dart';
import 'package:flutter/material.dart';
import '../utils/calculator_logic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CalculatorLogic logic = CalculatorLogic();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
          child: Column(
            children: [

              FirstCardScreen(
                input: logic.input,
                output: logic.output,
              ),

              const SizedBox(height: 12),

              Expanded(
                child: SecondCardScreen(
                  onTap: (value) {
                    setState(() {
                      logic.onButtonClick(value);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}