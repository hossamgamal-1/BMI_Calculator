import 'package:bmi_app/core/app_theme/app_dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:holding_gesture/holding_gesture.dart';

int myage = 0;
int myweight = 0;

class AgeWieght extends StatefulWidget {
  const AgeWieght({Key? key}) : super(key: key);

  @override
  State<AgeWieght> createState() => _AgeWieghtState();
}

class _AgeWieghtState extends State<AgeWieght> {
  @override
  Widget build(BuildContext context) {
    Container ageWeight(BuildContext context, {required String value}) {
      return Container(
        decoration: BoxDecoration(
          color: AppDarkTheme.panelBackgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value, style: AppDarkTheme.subTitleText),
            Container(
              child: value == 'Age'
                  ? Text('$myage', style: Theme.of(context).textTheme.headline1)
                  : Text('$myweight',
                      style: Theme.of(context).textTheme.headline1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HoldDetector(
                  holdTimeout: const Duration(milliseconds: 200),
                  onHold: () => setState(() {
                    value == 'Age'
                        ? myage > 0
                            ? myage--
                            : null
                        : myweight > 0
                            ? myweight--
                            : null;
                  }),
                  child: FloatingActionButton(
                    heroTag: value == 'Age' ? 'ageremove' : 'weightremove',
                    onPressed: () => setState(() {
                      value == 'Age'
                          ? myage > 0
                              ? myage--
                              : null
                          : myweight > 0
                              ? myweight--
                              : null;
                    }),
                    child: Icon(Icons.remove,
                        color: AppDarkTheme.selectedIconColor),
                  ),
                ),
                const SizedBox(width: 5),
                HoldDetector(
                  holdTimeout: const Duration(milliseconds: 100),
                  onHold: () =>
                      setState(() => value == 'Age' ? myage++ : myweight++),
                  child: FloatingActionButton(
                    heroTag: value == 'Age' ? 'ageadd' : 'weightadd',
                    onPressed: () =>
                        setState(() => value == 'Age' ? myage++ : myweight++),
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ageWeight(context, value: 'Weight'),
        ageWeight(context, value: 'Age'),
      ],
    );
  }
}
