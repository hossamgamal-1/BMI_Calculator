import 'package:flutter/material.dart';

class CalculationsAppBar extends StatelessWidget {
  const CalculationsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Body Mass Index'),
      centerTitle: true,
    );
  }
}
