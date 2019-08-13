import 'package:flutter/material.dart';

enum ScreenSizes {
  small,
  medium,
  large,
}

ScreenSizes screenSize(BuildContext context) {
  final double width = MediaQuery.of(context).size.width;
  if (width < 340) {
    return ScreenSizes.small;
  } else if (width < 540) {
    return ScreenSizes.medium;
  } else {
    return ScreenSizes.large;
  }
}

double getDayNumberSize(BuildContext context, double padding) {
  return (MediaQuery.of(context).size.width - padding * 2) / 7;
}

double getMonthViewHeight(BuildContext context) {
  const double padding = 8.0;
  const double titleHeight = 21.0;

  return (2 * padding) + titleHeight + 8.0 + (6 * getDayNumberSize(context, 0));
}