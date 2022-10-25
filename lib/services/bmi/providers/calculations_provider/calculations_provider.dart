import 'package:bmi_app/core/app_theme/app_dark_theme.dart';
import 'package:flutter/material.dart';

class CalculationsProvider with ChangeNotifier {
  String mygender = 'NaN';
  double myresult = 0.0;
  double myheight = 0.0;
  Color gMaleColor = AppDarkTheme.unselectedIconColor;
  Color gFemaleColor = AppDarkTheme.unselectedIconColor;
  int myage = 0;
  int myweight = 0;

  void selectMale() {
    gMaleColor = AppDarkTheme.selectedIconColor;
    gFemaleColor = AppDarkTheme.unselectedIconColor;
    mygender = 'Male';
    notifyListeners();
  }

  void selectFemale() {
    gFemaleColor = AppDarkTheme.selectedIconColor;
    gMaleColor = AppDarkTheme.unselectedIconColor;
    mygender = 'Female';
    notifyListeners();
  }

  void sliderSetter(double sliderValue) {
    myheight = sliderValue.roundToDouble();
    notifyListeners();
  }

  void ageWieghtIncrese(String value) {
    value == 'Age' ? myage++ : myweight++;
    notifyListeners();
  }

  void ageWieghtDecrese(String value) {
    if (value == 'Age' && myage > 0) {
      myage--;
    } else if (value != 'Age' && myweight > 0) {
      myweight--;
    }
    notifyListeners();
  }

  String healthness() {
    if (myresult.isNaN) {
      return 'NaN';
    } else if (myresult < 18.5) {
      return 'UnderWeight';
    } else if (myresult < 25) {
      return 'Normal';
    } else if (myresult < 30) {
      return 'OverWeight';
    } else {
      return 'Obese';
    }
  }

  void getResult() {
    myresult = double.parse(
        (myweight / ((myheight / 100) * (myheight / 100))).toStringAsFixed(2));
    notifyListeners();
  }
}
