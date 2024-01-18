import 'package:flutter/material.dart';
import 'package:meta_car_wash/constant/navigation_service.dart';
import 'package:meta_car_wash/features/add_new_vehicles_page/add_new_vehicles_page.dart';
import 'package:meta_car_wash/global_component/appBar/app_bar.dart';
import 'package:meta_car_wash/global_component/buttons/Kdrop_down_field.dart';
import 'package:meta_car_wash/utils/assets/app_assets.dart';
import 'package:meta_car_wash/utils/colors/app_colors.dart';
import 'package:meta_car_wash/utils/extension/extension.dart';
import 'package:meta_car_wash/utils/size/k_size.dart';
import 'package:meta_car_wash/utils/text_styles/text_styles.dart';

class AddVehiclesTypePage extends StatefulWidget {
  const AddVehiclesTypePage({super.key});

  @override
  State<AddVehiclesTypePage> createState() => _AddVehiclesTypePageState();
}

class _AddVehiclesTypePageState extends State<AddVehiclesTypePage> {
  bool mordern = true;
  bool classic = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: KAppBar(
          title: "Add Vehicles Type",
          checkTitle: true,
          leading: IconButton(
              onPressed: () {
                NavigationService.popNavigate();
              },
              icon: const Icon(Icons.arrow_back_ios)),
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
                        mordern = true;
                        classic = false;
                      });
                    },
                    child: Container(
                      width: context.screenWidth * 1,
                      decoration: BoxDecoration(
                        color: mordern ? KColor.primary : KColor.black,
                        border: Border.all(color: KColor.white, width: 3),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.mordern,
                            width: KSize.getWidth(context, 210),
                            height: KSize.getHeight(context, 110),
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "Mordern",
                            style: TextStyles.headline1.copyWith(
                                color: mordern ? KColor.black : KColor.white),
                          ),
                          SizedBox(
                            width: KSize.getWidth(context, 240),
                            child: Text(
                              "Vehicles that are a later model production or currently produced.",
                              textAlign: TextAlign.center,
                              style: TextStyles.bodyText1.copyWith(
                                  color: mordern ? KColor.black : KColor.white,
                                  wordSpacing: 7),
                            ),
                          )
                        ],
                      ),
                    ))),
            Expanded(
                child: InkWell(
                    onTap: () {
                      setState(() {
                        mordern = false;
                        classic = true;
                      });
                    },
                    child: Container(
                      width: context.screenWidth * 1,
                      decoration: BoxDecoration(
                        border: Border.all(color: KColor.white, width: 3),
                        color: classic ? KColor.primary : KColor.black,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.classic,
                            width: KSize.getWidth(context, 260),
                            height: KSize.getHeight(context, 110),
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "Classic",
                            style: TextStyles.headline1.copyWith(
                                color: classic ? KColor.black : KColor.white),
                          ),
                          SizedBox(
                            width: KSize.getWidth(context, 240),
                            child: Text(
                              "Older production vehicles or one that is no longer manufactured.",
                              textAlign: TextAlign.center,
                              style: TextStyles.bodyText1.copyWith(
                                  color: classic ? KColor.black : KColor.white,
                                  wordSpacing: 7),
                            ),
                          )
                        ],
                      ),
                    )))
          ],
        ),
      ),
      bottomNavigationBar: KButton(
        title: mordern ? "MORDERN" : "CLASSIC",
        alignment: true,
        textStyle: TextStyles.bodyText1.copyWith(color: KColor.white),
        width: double.infinity,
        height: 50,
        radius: 0,
        color: KColor.primary,
        trailingTitleIcon: Icon(
          Icons.arrow_forward_outlined,
          color: KColor.white,
          size: 20,
        ),
        onPressedCallback: () {
          NavigationService.navigateTo(SlideLeftRoute(
              page: AddNewVehiclesPage(
            title: mordern ? "Mordern" : "Classic",
          )));
        },
      ),
    );
  }
}
