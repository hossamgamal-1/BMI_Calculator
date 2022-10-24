import 'package:bmi_app/services/bmi/view/widgets/calculations_screen/age_weight.dart';
import 'package:bmi_app/services/bmi/view/widgets/calculations_screen/height.dart';
import 'package:flutter/material.dart';

import '../../screens/result_screen.dart';

class CalculateButton extends StatefulWidget {
  const CalculateButton({Key? key}) : super(key: key);

  @override
  State<CalculateButton> createState() => _CalculateButtonState();
}

class _CalculateButtonState extends State<CalculateButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 10,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20)),
      child: TextButton(
        child: const Center(
          child: Text(
            'Calculate',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onPressed: () {
          setState(() {
            myresult = double.parse(
                (myweight / ((myheight / 100) * (myheight / 100)))
                    .toStringAsFixed(2));
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const Result();
                },
              ),
            );
          });
        },
      ),
    );
  }
}
