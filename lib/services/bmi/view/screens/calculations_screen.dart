import 'package:bmi_app/core/app_theme/app_dark_theme.dart';
import 'package:bmi_app/services/bmi/view/widgets/calculations_screen/gender.dart';
import 'package:flutter/material.dart';
import '../widgets/calculations_screen/height.dart';
//import '../widgets/calculations_screen/appBar.dart';
import '../widgets/calculations_screen/calculate_button.dart';
import '../widgets/calculations_screen/age_weight.dart';

class CalculationsScreen extends StatelessWidget {
  const CalculationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Mass Index'),
        centerTitle: true,
      ), //CalculationsAppBar(),
      body: Column(
        children: const [
          Expanded(child: Gender()),
          Expanded(child: Height()),
          Expanded(child: AgeWieght()),
          CalculateButton(),
        ],
      ),
      backgroundColor: AppDarkTheme.themeData.canvasColor,
    );
  }
}
