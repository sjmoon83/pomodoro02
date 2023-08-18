import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white),
      ),
      onPressed: selectTwenty,
      child: Text(
        '20',
        style: TextStyle(
          color: Theme.of(context).colorScheme.background,
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
