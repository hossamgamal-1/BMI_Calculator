import 'package:bmi_app/core/app_sizes/app_sizes.dart';
import 'package:bmi_app/core/app_theme/app_dark_theme.dart';
import 'package:bmi_app/services/bmi/view/widgets/calculations_screen/gender.dart';
import 'package:flutter/material.dart';
import '../widgets/calculations_screen/height.dart';
import '../widgets/calculations_screen/calculate_button.dart';
import '../widgets/calculations_screen/age_weight.dart';

class CalculationsScreen extends StatelessWidget {
  const CalculationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes appSizes = AppSizes(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Mass Index'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: appSizes.deviceOrientation == Orientation.portrait
                    ? appSizes.fixedDeviceWidth * 0.05
                    : 0,
              ),
              child: Column(
                children: const [
                  Gender(),
                  Height(),
                  AgeWieght(),
                ],
              )),
          SizedBox(height: 8 * AppSizes(context).rotationDeviceWidth / 480),
          const CalculateButton(),
        ],
      )),
      backgroundColor: AppDarkTheme.themeData.canvasColor,
    );
  }
}
