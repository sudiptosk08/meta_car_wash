import 'package:flutter/material.dart';
import 'package:meta_car_wash/utils/colors/app_colors.dart';

import '../../../../utils/text_styles/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.name,
      required this.onTap,
      required this.width,
      required this.height,
      required this.trailIcon,
      this.textColor,
      required this.color});
  final String name;
  final double width;
  final String? textColor;
  final double height;
  final Color color;
  final bool trailIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyles.subTitle.copyWith(
                  color: textColor == "primary" ? KColor.primary : KColor.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              trailIcon
                  ? Icon(
                      Icons.arrow_forward_outlined,
                      color: KColor.white,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
