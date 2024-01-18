import 'package:flutter/material.dart';
import 'package:meta_car_wash/constant/navigation_service.dart';
import 'package:meta_car_wash/features/auth/auth_page.dart';
import 'package:meta_car_wash/global_component/buttons/Kdrop_down_field.dart';
import 'package:meta_car_wash/utils/assets/app_assets.dart';
import 'package:meta_car_wash/utils/colors/app_colors.dart';
import 'package:meta_car_wash/utils/extension/extension.dart';
import 'package:meta_car_wash/utils/size/k_size.dart';
import 'package:meta_car_wash/utils/text_styles/text_styles.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.screenWidth * 1,
        height: context.screenHeight * 1,
        decoration: BoxDecoration(
          color: KColor.transparent,
          image: const DecorationImage(
              image: AssetImage(
                AppAssets.introImage,
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                    width: context.screenWidth * 1,
                    height: context.screenHeight * 1,
                    color: KColor.transparent.withOpacity(0.25)),
                Positioned(
                  top: context.screenHeight * 0.4,
                  left: context.screenWidth * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.logo,
                        width: 110,
                        height: 110,
                      ),
                      SizedBox(
                        width: KSize.getWidth(context, 10),
                      ),
                      Text(
                        "Meta \nCar Wash",
                        style: TextStyles.headline1.copyWith(
                            color: KColor.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: KButton(
          title: "Get Started",
          alignment: true,
          textStyle: TextStyles.bodyText1.copyWith(color: KColor.white),
          width: 200,
          height: 40,
          radius: 30,
          color: KColor.primary,
          onPressedCallback: () {
            NavigationService.navigateTo(
                SlideLeftRoute(page: const AuthPage()));
          },
        ),
      ),
    );
  }
}
