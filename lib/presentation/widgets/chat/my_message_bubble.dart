import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  final String message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    // buscar el tema del contexto
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          // height: 10,
          // width: 10,
          decoration: BoxDecoration(
              color: Colors.orange, borderRadius: BorderRadius.circular(30)),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
