import 'package:flutter/material.dart';
import 'package:meta_car_wash/constant/navigation_service.dart';
import 'package:meta_car_wash/features/select_vehicles_page/select_vehicles_page.dart';
import 'package:meta_car_wash/global_component/buttons/Kdrop_down_field.dart';
import 'package:meta_car_wash/global_component/drawer/drawer.dart';
import 'package:meta_car_wash/utils/colors/app_colors.dart';
import 'package:meta_car_wash/utils/extension/extension.dart';
import 'package:meta_car_wash/utils/size/k_size.dart';
import 'package:meta_car_wash/utils/text_styles/text_styles.dart';

class ReminderPage extends StatelessWidget {
  ReminderPage({super.key});
  List<dynamic> hightlights = [
    {
      'title':
          "All service providers are independent businesses, background checked, vetted and insured professionals, known as mobile washers."
    },
    {
      'title':
          "MobileWash is a technology platform that connects customers to washers."
    },
    {
      'title':
          "All washers are fully equipped with pressure washers, power supply ,spot-free water and all other necessary materials to bring your vehicle to a full shine.Rest assured these are the best independent businesses in the industry."
    },
    {'title': "100 % of your tips go to your washers."},
  ];
  List<dynamic> guidelines = [
    {'title': "Please remove all valuables before your washer arrives."},
    {'title': "Service results may vary based on conditions."},
    {
      'title':
          "Wash durations are estimates and may vary based on your vehicle's condition and/or multiple."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.screenWidth * 1,
                  height: context.screenHeight * 0.15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "REMINDER",
                        style: TextStyles.bodyText1,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "\$5.00 off your 5th vehicle wash",
                        style: TextStyles.bodyText1,
                      ),
                    ],
                  ),
                ),
                Text(
                  "Highlights",
                  style: TextStyles.bodyText1,
                ),
                ...List.generate(
                    hightlights.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Icon(
                                  Icons.brightness_1,
                                  color: KColor.black,
                                  size: 7,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: KSize.getWidth(context, 310),
                                child: Text(
                                  hightlights[index]['title'],
                                  maxLines: 6,
                                  textAlign: TextAlign.justify,
                                  style: TextStyles.bodyText1
                                      .copyWith(color: KColor.greyText),
                                ),
                              ),
                            ],
                          ),
                        )),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Guidelines",
                  style: TextStyles.bodyText1,
                ),
                ...List.generate(
                    guidelines.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Icon(
                                  Icons.brightness_1,
                                  color: KColor.black,
                                  size: 7,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: KSize.getWidth(context, 310),
                                child: Text(
                                  guidelines[index]['title'],
                                  maxLines: 6,
                                  textAlign: TextAlign.justify,
                                  style: TextStyles.bodyText1
                                      .copyWith(color: KColor.greyText),
                                ),
                              ),
                            ],
                          ),
                        )),
              ],
            ),
          ),
          Positioned(
              top: 35,
              left: 12,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: KColor.borderColor,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
              ))
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: KButton(
          radius: 30,
          height: 40,
          onPressedCallback: () async {
            NavigationService.navigateTo(
                FadeRoute(page: const SelectVehiclesPage()));
          },
          width: KSize.getWidth(context, 250),
          title: "I Agreed",
          textColor: KColor.white,
        ),
      ),
      endDrawer: KDrawer(),
    );
  }
}
