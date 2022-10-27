import 'package:bmi_app/core/app_sizes/app_sizes.dart';
import 'package:bmi_app/core/app_theme/app_dark_theme.dart';
import 'package:bmi_app/services/bmi/model/enums/gender.dart';
import 'package:bmi_app/services/bmi/providers/calculations_provider/calculations_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Gender extends StatelessWidget {
  const Gender(this.gender, {Key? key}) : super(key: key);
  final UserGender gender;
  @override
  Widget build(BuildContext context) {
    var watch = context.watch<CalculationsProvider>();
    bool isMale = gender == UserGender.male;
    AppSizes appSizes = AppSizes(context);
    return Container(
      margin: EdgeInsets.all(10 * AppSizes(context).rotationDeviceWidth / 480),
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
}
