import 'package:flutter/material.dart';
import 'package:meta_car_wash/constant/navigation_service.dart';
import 'package:meta_car_wash/features/order_confirmation_page/order_confirmation_page.dart';
import 'package:meta_car_wash/global_component/appBar/app_bar.dart';
import 'package:meta_car_wash/global_component/buttons/Kdrop_down_field.dart';
import 'package:meta_car_wash/utils/colors/app_colors.dart';
import 'package:meta_car_wash/utils/extension/extension.dart';
import 'package:meta_car_wash/utils/size/k_size.dart';
import 'package:meta_car_wash/utils/text_styles/text_styles.dart';

class SelectAddOnsPage extends StatefulWidget {
  const SelectAddOnsPage({super.key});

  @override
  State<SelectAddOnsPage> createState() => _SelectAddOnsPageState();
}

class _SelectAddOnsPageState extends State<SelectAddOnsPage> {
  List<Map<String, dynamic>> items = [
    {
      "title": "Clay Bar & Paste Wax",
      "des":
          "Remove embedded contaminants from surfaces & keep vehicle shining for weeks.",
      "price": "\$55.00",
    },
    {
      "title": "Water Spot Removal",
      "des":
          "Remove embedded contaminants from surfaces & keep vehicle shining for weeks.",
      "price": "\$30.00",
    },
    {
      "title": "Upholstery Conditioning ",
      "des":
          "Remove embedded contaminants from surfaces & keep vehicle shining for weeks.",
      "price": "\$55.00",
    },
    {
      "title": "Floor Mat Cleaning",
      "des":
          "Remove embedded contaminants from surfaces & keep vehicle shining for weeks.",
      "price": "\$55.00",
    },
    {
      "title": "Liquid Hand Wax",
      "des":
          "Remove embedded contaminants from surfaces & keep vehicle shining for weeks.",
      "price": "\$55.00",
    },
    {
      "title": "Extra Cleaning Fee",
      "des":
          "Remove embedded contaminants from surfaces & keep vehicle shining for weeks.",
      "price": "\$55.00",
    },
  ];
  Set<int> selectedItems = Set<int>();
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
      body: Column(
        children: [
          Container(
            width: context.screenWidth * 1,
            height: context.screenHeight * 0.09,
            color: KColor.primary,
            alignment: Alignment.center,
            child: Text(
              "Upgrade your Package with the Following add-ons",
              textAlign: TextAlign.center,
              style: TextStyles.headline3.copyWith(color: KColor.white),
            ),
          ),
          SizedBox(
            width: context.screenWidth * 1,
            height: context.screenHeight * 0.7,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.all(7),
                  shape: const Border(
                      bottom: BorderSide(color: KColor.borderColor)),
                  onTap: () {
                    setState(() {
                      if (selectedItems.contains(index)) {
                        selectedItems.remove(index);
                      } else {
                        selectedItems.add(index);
                      }
                    });
                  },
                  tileColor: selectedItems.contains(index)
                      ? Colors.blue.withOpacity(0.5)
                      : KColor.black,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: KSize.getWidth(context, 255),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index]['title'],
                              style: TextStyles.bodyText1
                                  .copyWith(color: KColor.white),
                            ),
                            Text(
                              items[index]['des'],
                              style: TextStyles.bodyText3
                                  .copyWith(color: KColor.white),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        items[index]['price'],
                        style:
                            TextStyles.headline2.copyWith(color: KColor.white),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: KButton(
        title: "1ST VEHICLE-DELUXE",
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
              SlideLeftRoute(page: const OrderConfirmationPage()));
        },
      ),
    );
  }
}
