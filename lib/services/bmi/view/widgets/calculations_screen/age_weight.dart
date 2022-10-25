import 'package:bmi_app/core/app_sizes/app_sizes.dart';
import 'package:bmi_app/core/app_theme/app_dark_theme.dart';
import 'package:bmi_app/services/bmi/providers/calculations_provider/calculations_provider.dart';
import 'package:flutter/material.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:provider/provider.dart';

class AgeWieght extends StatelessWidget {
  const AgeWieght({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var watch = context.watch<CalculationsProvider>();
    Widget ageWeight(BuildContext context, {required String value}) {
      return Container(
        decoration: BoxDecoration(
          color: AppDarkTheme.panelBackgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        width: AppSizes(context).rotationDeviceWidth * 0.38,
        height: AppSizes(context).rotationDeviceHeight * 0.22,
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(value, style: AppTextStyle(context).subTitleText),
            Container(
              child: value == 'Age'
                  ? Text('${watch.myage}',
                      style: AppTextStyle(context).subTitleText)
                  : Text('${watch.myweight}',
                      style: AppTextStyle(context).subTitleText),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HoldDetector(
                  holdTimeout: const Duration(milliseconds: 150),
                  onHold: () => context
                      .read<CalculationsProvider>()
                      .ageWieghtDecrese(value),
                  child: FloatingActionButton(
                    heroTag: value == 'Age' ? 'ageRemove' : 'weightRemove',
                    onPressed: () => context
                        .read<CalculationsProvider>()
                        .ageWieghtDecrese(value),
                    child: Icon(Icons.remove,
                        color: AppDarkTheme.selectedIconColor),
                  ),
                ),
                const SizedBox(width: 5),
                HoldDetector(
                  holdTimeout: const Duration(milliseconds: 100),
                  onHold: () => context
                      .read<CalculationsProvider>()
                      .ageWieghtIncrese(value),
                  child: FloatingActionButton(
                    heroTag: value == 'Age' ? 'ageAdd' : 'weightAdd',
                    onPressed: () => context
                        .read<CalculationsProvider>()
                        .ageWieghtIncrese(value),
                    child:
                        Icon(Icons.add, color: AppDarkTheme.selectedIconColor),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ageWeight(context, value: 'Weight'),
        ageWeight(context, value: 'Age'),
      ],
    );
  }
}
