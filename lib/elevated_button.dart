import 'package:flutter/material.dart';

class StyledElevatedButton extends StatelessWidget {
  const StyledElevatedButton(
      {required this.answerText, required this.onPressed, super.key});

  final String answerText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal:40),
        backgroundColor: const Color.fromARGB(255, 8, 71, 123),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(answerText,textAlign: TextAlign.center),
    );
  }
}
