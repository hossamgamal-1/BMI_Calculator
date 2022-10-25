import 'package:bmi_app/core/app_sizes/app_sizes.dart';
import 'package:bmi_app/core/app_theme/app_dark_theme.dart';
import 'package:bmi_app/services/bmi/model/enums/gender.dart';
import 'package:bmi_app/services/bmi/providers/calculations_provider/calculations_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Gender extends StatelessWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget gender(UserGender gender) {
      var watch = context.watch<CalculationsProvider>();
      bool isMale = gender == UserGender.male;
      AppSizes appSizes = AppSizes(context);
      return Container(
        width: appSizes.rotationDeviceWidth * 0.38,
        height: appSizes.rotationDeviceHeight * 0.22,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppDarkTheme.panelBackgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isMale ? Icons.male : Icons.female,
                color: isMale ? watch.gMaleColor : watch.gFemaleColor,
                size: 90 * appSizes.rotationDeviceWidth / 480,
              ),
              Text(
                isMale ? 'Male' : 'Female',
                style: AppTextStyle(context).headLine1.copyWith(
                    color: isMale ? watch.gMaleColor : watch.gFemaleColor),
              ),
            ],
          ),
          onTap: () => isMale
              ? context.read<CalculationsProvider>().selectMale()
              : context.read<CalculationsProvider>().selectFemale(),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        gender(UserGender.male),
        gender(UserGender.female),
      ],
    );
  }
}
