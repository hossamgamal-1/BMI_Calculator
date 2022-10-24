import 'package:bmi_app/core/app_theme/app_dark_theme.dart';
import 'package:flutter/material.dart';

class Height extends StatefulWidget {
  const Height({Key? key}) : super(key: key);

  @override
  State<Height> createState() => _HeightState();
}

double myheight = 0.0;

class _HeightState extends State<Height> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppDarkTheme.panelBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      width: MediaQuery.of(context).size.width / (15 / 13),
      height: MediaQuery.of(context).size.height / 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Height', style: AppDarkTheme.subTitleText),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('$myheight',
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
              value: myheight,
              onChanged: (slidervalue) =>
                  setState(() => myheight = slidervalue.roundToDouble()),
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
