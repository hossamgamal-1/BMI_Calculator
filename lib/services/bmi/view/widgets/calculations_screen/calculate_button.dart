import 'package:bmi_app/core/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/result_screen.dart';
import 'package:bmi_app/services/bmi/providers/calculations_provider/calculations_provider.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSizes(context).rotationDeviceHeight * 0.1,
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
          context.read<CalculationsProvider>().getResult();

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const Result();
              },
            ),
          );
        },
      ),
    );
  }
}
