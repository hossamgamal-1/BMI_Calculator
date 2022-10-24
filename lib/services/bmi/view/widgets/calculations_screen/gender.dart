import 'package:bmi_app/core/app_theme/app_dark_theme.dart';
import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  State<Gender> createState() => _GenderState();
}

String mygender = 'NaN';

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        genderM(),
        genderF(),
      ],
    );
  }

  Color gMaleColor = AppDarkTheme.unselectedIconColor;
  Color gFemaleColor = AppDarkTheme.unselectedIconColor;

  InkWell genderM() {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 4,
        decoration: BoxDecoration(
          color: AppDarkTheme.panelBackgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.male, color: gMaleColor, size: 90),
            Text(
              'Male',
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: gMaleColor),
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          gMaleColor = AppDarkTheme.selectedIconColor;
          gFemaleColor = AppDarkTheme.unselectedIconColor;
          mygender = 'Male';
        });
      },
    );
  }

  InkWell genderF() {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 4,
        decoration: BoxDecoration(
          color: AppDarkTheme.panelBackgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.female, color: gFemaleColor, size: 90),
            Text(
              'Female',
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: gFemaleColor),
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          gFemaleColor = AppDarkTheme.selectedIconColor;
          gMaleColor = AppDarkTheme.unselectedIconColor;
          mygender = 'Female';
        });
      },
    );
  }
}
