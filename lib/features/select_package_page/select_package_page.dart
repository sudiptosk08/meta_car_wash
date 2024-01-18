import 'package:flutter/material.dart';
import 'package:meta_car_wash/constant/navigation_service.dart';
import 'package:meta_car_wash/features/package_details_page/package_details_page.dart';
import 'package:meta_car_wash/features/select_add_ons/select_add_ons_page.dart';
import 'package:meta_car_wash/global_component/appBar/app_bar.dart';
import 'package:meta_car_wash/global_component/buttons/Kdrop_down_field.dart';
import 'package:meta_car_wash/utils/assets/app_assets.dart';
import 'package:meta_car_wash/utils/colors/app_colors.dart';
import 'package:meta_car_wash/utils/extension/extension.dart';
import 'package:meta_car_wash/utils/size/k_size.dart';
import 'package:meta_car_wash/utils/text_styles/text_styles.dart';

import '../order_confirmation_page/order_confirmation_page.dart';

class SelectPackagePage extends StatefulWidget {
  const SelectPackagePage({super.key});

  @override
  State<SelectPackagePage> createState() => _SelectPackagePageState();
}

class _SelectPackagePageState extends State<SelectPackagePage> {
  bool express = false;
  bool deluxe = false;
  bool premium = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KAppBar(
          title: "Select Package",
          checkTitle: true,
          leading: IconButton(
              onPressed: () {
                NavigationService.popNavigate();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: KColor.black,
              )),
        ),
      ),
      body: SizedBox(
        width: context.screenWidth * 1,
        height: context.screenHeight * 1,
        child: Column(
          children: [
            Expanded(
                child: InkWell(
                    onTap: () {
                      setState(() {
                        express = true;
                        deluxe = false;
                        premium = false;
                      });
                    },
                    child: Container(
                      width: context.screenWidth * 1,
                      decoration: BoxDecoration(
                        color: express ? KColor.primary : KColor.black,
                        border: Border.all(color: KColor.white, width: 3),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "\$26.99",
                            style: TextStyles.headline1
                                .copyWith(color: KColor.white),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          InkWell(
                            onTap: () {
                              NavigationService.navigateTo(SlideLeftRoute(
                                  page: PackageDetailsPage(
                                title: "Express",
                              )));
                            },
                            child: Container(
                              width: KSize.getWidth(context, 200),
                              height: KSize.getHeight(context, 45),
                              decoration: BoxDecoration(
                                  color:
                                      express ? KColor.white : KColor.primary,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "      Express Wash",
                                    style: TextStyles.bodyText1.copyWith(
                                      height: 1,
                                      fontSize: 20,
                                      color: express
                                          ? KColor.primary
                                          : KColor.white,
                                    ),
                                  ),
                                  Image.asset(
                                    AppAssets.i2,
                                    color: express ? KColor.grey : KColor.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          SizedBox(
                            width: KSize.getWidth(context, 310),
                            child: Text(
                              "This package is available with multiple vehicles or on it’s own with at least one add-on",
                              textAlign: TextAlign.center,
                              style: TextStyles.bodyText3
                                  .copyWith(color: KColor.white, fontSize: 13),
                            ),
                          )
                        ],
                      ),
                    ))),
            Expanded(
                child: InkWell(
                    onTap: () {
                      setState(() {
                        express = false;

                        deluxe = true;
                        premium = false;
                      });
                    },
                    child: Container(
                      width: context.screenWidth * 1,
                      decoration: BoxDecoration(
                        border: Border.all(color: KColor.white, width: 3),
                        color: deluxe ? KColor.primary : KColor.black,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "\$34.99",
                            style: TextStyles.headline1
                                .copyWith(color: KColor.white),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          InkWell(
                            onTap: () {
                              NavigationService.navigateTo(SlideLeftRoute(
                                  page: PackageDetailsPage(
                                title: "Deluxe ",
                              )));
                            },
                            child: Container(
                              width: KSize.getWidth(context, 200),
                              height: KSize.getHeight(context, 45),
                              decoration: BoxDecoration(
                                  color: deluxe ? KColor.white : KColor.primary,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "      Deluxe Wash",
                                    style: TextStyles.bodyText1.copyWith(
                                      height: 1,
                                      fontSize: 20,
                                      color: deluxe
                                          ? KColor.primary
                                          : KColor.white,
                                    ),
                                  ),
                                  Image.asset(
                                    AppAssets.i2,
                                    color: deluxe ? KColor.grey : KColor.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          SizedBox(
                            width: KSize.getWidth(context, 310),
                            child: Text(
                              " Estimated Wash Duration 50 min",
                              textAlign: TextAlign.center,
                              style: TextStyles.bodyText3
                                  .copyWith(color: KColor.white, fontSize: 13),
                            ),
                          )
                        ],
                      ),
                    ))),
            Expanded(
                child: InkWell(
                    onTap: () {
                      setState(() {
                        express = false;

                        deluxe = false;
                        premium = true;
                      });
                    },
                    child: Container(
                      width: context.screenWidth * 1,
                      decoration: BoxDecoration(
                        border: Border.all(color: KColor.white, width: 3),
                        color: premium ? KColor.primary : KColor.black,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "74.99",
                            style: TextStyles.headline1
                                .copyWith(color: KColor.white),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          InkWell(
                            onTap: () {
                              NavigationService.navigateTo(SlideLeftRoute(
                                  page: PackageDetailsPage(
                                title: "Premium",
                              )));
                            },
                            child: Container(
                              width: KSize.getWidth(context, 200),
                              height: KSize.getHeight(context, 45),
                              decoration: BoxDecoration(
                                  color:
                                      premium ? KColor.white : KColor.primary,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "      Premium Wash",
                                    style: TextStyles.bodyText1.copyWith(
                                      height: 1,
                                      fontSize: 20,
                                      color: premium
                                          ? KColor.primary
                                          : KColor.white,
                                    ),
                                  ),
                                  Image.asset(
                                    AppAssets.i2,
                                    color: premium ? KColor.grey : KColor.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          SizedBox(
                            width: KSize.getWidth(context, 240),
                            child: Text(
                              "Estimated Wash Duration 50 min",
                              textAlign: TextAlign.center,
                              style: TextStyles.bodyText3.copyWith(
                                  color: deluxe ? KColor.black : KColor.white,
                                  fontSize: 13),
                            ),
                          )
                        ],
                      ),
                    )))
          ],
        ),
      ),
      bottomNavigationBar: KButton(
        title: express ? "1ST VEHICLE-EXPRESS" : "1ST VEHICLE-DELUXE",
        alignment: true,
        textStyle: TextStyles.bodyText1.copyWith(color: KColor.white),
        width: double.infinity,
        height: 50,
        radius: 0,
        color: KColor.primary,
        // trailingTitleIcon: Icon(
        //   Icons.arrow_forward_outlined,
        //   color: KColor.white,
        //   size: 20,
        // ),
        onPressedCallback: () {
          NavigationService.navigateTo(
              SlideLeftRoute(page: const SelectAddOnsPage()));
        },
      ),
    );
  }
}
