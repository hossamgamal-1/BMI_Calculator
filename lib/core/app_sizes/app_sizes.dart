import 'package:flutter/material.dart';

class AppSizes {
  BuildContext context;
  AppSizes(this.context);
  Orientation get deviceOrientation => MediaQuery.of(context).orientation;
  double get fixedDeviceHeight => MediaQuery.of(context).size.height;
  double get fixedDeviceWidth => MediaQuery.of(context).size.width;
  double get rotationDeviceHeight => deviceOrientation == Orientation.portrait
      ? MediaQuery.of(context).size.height
      : MediaQuery.of(context).size.width;
  double get rotationDeviceWidth => deviceOrientation == Orientation.portrait
      ? MediaQuery.of(context).size.width
      : MediaQuery.of(context).size.height;
}
