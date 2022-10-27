import 'package:bmi_app/core/app_sizes/app_sizes.dart';
import 'package:bmi_app/core/app_theme/app_dark_theme.dart';
import 'package:bmi_app/services/bmi/providers/calculations_provider/calculations_provider.dart';
import 'package:flutter/material.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:provider/provider.dart';

class AgeWeight extends StatelessWidget {
  const AgeWeight({required this.value, Key? key}) : super(key: key);
  final String value;
  @override
  Widget build(BuildContext context) {
    var watch = context.watch<CalculationsProvider>();
    return Container(
      decoration: BoxDecoration(
        color: AppDarkTheme.panelBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(10 * AppSizes(context).rotationDeviceWidth / 480),
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
                child: SizedBox(
                  height: 55 * AppSizes(context).rotationDeviceWidth / 480,
                  width: 55 * AppSizes(context).rotationDeviceWidth / 480,
                  child: FloatingActionButton(
                    heroTag: value == 'Age' ? 'ageRemove' : 'weightRemove',
                    onPressed: () => context
                        .read<CalculationsProvider>()
                        .ageWieghtDecrese(value),
                    child: Icon(
                      Icons.remove,
                      color: AppDarkTheme.selectedIconColor,
                      size: 25 * AppSizes(context).rotationDeviceWidth / 480,
                    ),
                  ),
                ),
              ),
              HoldDetector(
                holdTimeout: const Duration(milliseconds: 100),
                onHold: () => context
                    .read<CalculationsProvider>()
                    .ageWieghtIncrese(value),
                child: SizedBox(
                  height: 55 * AppSizes(context).rotationDeviceWidth / 480,
                  width: 55 * AppSizes(context).rotationDeviceWidth / 480,
                  child: FloatingActionButton(
                    heroTag: value == 'Age' ? 'ageAdd' : 'weightAdd',
                    onPressed: () => context
                        .read<CalculationsProvider>()
                        .ageWieghtIncrese(value),
                    child: Icon(
                      Icons.add,
                      size: 25 * AppSizes(context).rotationDeviceWidth / 480,
                      color: AppDarkTheme.selectedIconColor,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
