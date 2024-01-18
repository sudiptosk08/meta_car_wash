import 'package:flutter/material.dart';
import 'package:meta_car_wash/utils/assets/app_assets.dart';
import 'package:meta_car_wash/utils/colors/app_colors.dart';

import '../../../../utils/text_styles/text_styles.dart';

class HomeAppBar extends StatelessWidget {
  final Color? color;
  const HomeAppBar({
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 19),
      height: 76,
      decoration: BoxDecoration(
          color: color,
          border: Border(
              bottom: BorderSide(
                  color: color == KColor.background
                      ? KColor.borderColor
                      : KColor.transparent))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.appIcon,
            height: 38.2,
            width: 38.2,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            "Meta \nCar Wash",
            style: TextStyles.headline5.copyWith(
                height: 1,
                color: color == KColor.background
                    ? KColor.primary
                    : KColor.primary),
          )
        ],
      ),
    );
  }
}
