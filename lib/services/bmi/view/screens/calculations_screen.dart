import 'package:bmi_app/core/app_sizes/app_sizes.dart';
import 'package:bmi_app/core/app_theme/app_dark_theme.dart';
import 'package:bmi_app/services/bmi/model/enums/gender.dart';
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
    AppBar appBar = AppBar(
      title: Text(
        'Body Mass Index',
        style: TextStyle(
          fontSize: 20 * AppSizes(context).rotationDeviceWidth / 480,
        ),
      ),
      centerTitle: true,
    );
    double heightUnit = (MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top);
    Widget widgetSizer(Widget widget) {
      return SizedBox(
        width: appSizes.rotationDeviceWidth * 0.9,
        height: heightUnit * 0.27,
        child: widget,
      );
    }

    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: appSizes.fixedDeviceWidth * 0.05,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              widgetSizer(
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: appSizes.rotationDeviceWidth * 0.45,
                      child: const Gender(UserGender.male),
                    ),
                    SizedBox(
                      width: appSizes.rotationDeviceWidth * 0.45,
                      child: const Gender(UserGender.female),
                    ),
                  ],
                ),
              ),
              widgetSizer(const Height()),
              widgetSizer(
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: appSizes.rotationDeviceWidth * 0.45,
                      child: const AgeWeight(value: 'Weight'),
                    ),
                    SizedBox(
                      width: appSizes.rotationDeviceWidth * 0.45,
                      child: const AgeWeight(value: 'Age'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppSizes(context).rotationDeviceWidth * 0.019,
              ),
              const CalculateButton(),
            ],
          ),
        ),
      ),
      backgroundColor: AppDarkTheme.themeData.canvasColor,
    );
  }
}
