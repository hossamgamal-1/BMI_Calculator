import 'package:bmi_app/core/app_sizes/app_sizes.dart';
import 'package:bmi_app/core/app_theme/app_dark_theme.dart';
import 'package:bmi_app/services/bmi/providers/calculations_provider/calculations_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Height extends StatelessWidget {
  const Height({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var watch = context.watch<CalculationsProvider>();
    return Container(
      decoration: BoxDecoration(
        color: AppDarkTheme.panelBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      width: AppSizes(context).rotationDeviceWidth * 0.85,
      height: AppSizes(context).rotationDeviceHeight * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Height', style: AppTextStyle(context).subTitleText),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('${watch.myheight}',
                    style: Theme.of(context).textTheme.headline1),
              ),
              const Text('CM', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
                activeTrackColor: AppDarkTheme.selectedIconColor,
                inactiveTrackColor: AppDarkTheme.unselectedIconColor,
                thumbColor: AppDarkTheme.textButtonBackgroundColor,
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 14)),
            child: Slider.adaptive(
              value: watch.myheight,
              onChanged: context.read<CalculationsProvider>().sliderSetter,
              min: 0,
              divisions: 210,
              max: 210,
            ),
          )
        ],
      ),
    );
  }
}
