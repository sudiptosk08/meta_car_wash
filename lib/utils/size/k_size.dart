import 'package:flutter/material.dart';
import 'package:meta_car_wash/utils/extension/extension.dart';

/*
Focus: To maintain app wide design consistency all
the sizes(height/width) that are used in this app should be declared 
using methods of this class.
*/

class KSize {
  static double getWidth(BuildContext context, width) {
    double width0 = (((100 / 375) * width) / 100) * context.screenWidth;
    return width0;
  }

  static double getHeight(BuildContext context, height) {
    double height0 = (((100 / 812) * height) / 100) * context.screenHeight;
    return height0;
  }


}
