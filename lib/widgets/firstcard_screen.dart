import 'package:flutter/material.dart';
import '../main.dart';
import '../utils/calculator_logic.dart';

class FirstCardScreen extends StatefulWidget {
  final String input;
  final String output;

  final List<HistoryItem> history;
  final VoidCallback onClearHistory;

  const FirstCardScreen({
    super.key,
    required this.input,
    required this.output,
    required this.history,
    required this.onClearHistory,
  });

  @override
  State<FirstCardScreen> createState() => FirstCardScreenState();
}

class FirstCardScreenState extends State<FirstCardScreen> {
  void showHistorySheet(BuildContext context) {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      backgroundColor: theme.scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "History",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      widget.onClearHistory();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Clear",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Expanded(
                child: widget.history.isEmpty
                    ? const Center(child: Text("No History Yet"))
                    : ListView.builder(
                        itemCount: widget.history.length,
                        itemBuilder: (context, index) {
                          final item = widget.history[index];

                          return ListTile(
                            title: Text(item.expression),
                            trailing: Text(
                              item.result,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

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
          colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
        ),
        border: Border.all(color: theme.colorScheme.surfaceDim),
      ),
      child: Column(
        children: [
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
                    ),
                    child: const Icon(Icons.wb_sunny_outlined),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    showHistorySheet(context);
                  },
                  child: Container(
                    height: 50,
                    width: 40,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.history),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(widget.input, style: const TextStyle(fontSize: 22)),

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
