import 'package:flutter/material.dart';
import 'package:meta_car_wash/constant/navigation_service.dart';
import 'package:meta_car_wash/global_component/appBar/app_bar.dart';
import 'package:meta_car_wash/global_component/buttons/Kdrop_down_field.dart';
import 'package:meta_car_wash/utils/colors/app_colors.dart';
import 'package:meta_car_wash/utils/extension/extension.dart';
import 'package:meta_car_wash/utils/size/k_size.dart';
import 'package:meta_car_wash/utils/text_styles/text_styles.dart';

class OrderConfirmationPage extends StatefulWidget {
  const OrderConfirmationPage({super.key});

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  List<Map<String, dynamic>> items = [
    {
      "car": "Rolls Royec",
      "package": "Delux",
      "price": "\$39.00",
    },
    {
      "car": "XCAROLA",
      "package": "Premium",
      "price": "\$37.00",
    },
    {
      "car": "Audi ",
      "package": "Premium",
      "price": "\$37.00",
    },
  ];
  int currentIndex = 0;
  List tips = [
    {
      'id': 0,
      'title': "No Tips",
      'amount': '0',
    },
    {
      'id': 1,
      'title': '10%',
      'amount': '4.20',
    },
    {
      'id': 2,
      'title': '15%',
      'amount': '6.50',
    },
    {
      'id': 3,
      'title': '20%',
      'amount': '8.20',
    },
  ];

  int? selectedAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KAppBar(
          title: "Order Confirmation",
          leading: IconButton(
              onPressed: () {
                NavigationService.popNavigate();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: KColor.black,
              )),
          checkTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.screenWidth * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Wash Location",
                          style: TextStyles.subTitle,
                        ),
                        Text(
                          "Street Banasree ,Meradia Bazar , Block J, Road 3, House 423 , Dhaka, Bangladesh",
                          style: TextStyles.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Change",
                      style:
                          TextStyles.subTitle.copyWith(color: KColor.primary),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: KColor.borderColor,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.screenWidth * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Payment Method",
                          style: TextStyles.subTitle,
                        ),
                        const Icon(
                          Icons.payment,
                          color: KColor.primary,
                        ),
                        Text(
                          "Please enter a payment method",
                          style: TextStyles.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Change",
                      style:
                          TextStyles.subTitle.copyWith(color: KColor.primary),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: KColor.borderColor,
              thickness: 1,
            ),
            ListView.builder(
              itemCount: items.length,
              shrinkWrap: true, // Ensure the ListView doesn't take extra space
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: context.screenWidth * 1,
                  height: context.screenHeight * 0.08,
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(left: 10, right: 10),
                    shape: const Border(
                        bottom: BorderSide(color: KColor.borderColor)),
                    tileColor: KColor.primary,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: KSize.getWidth(context, 255),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                items[index]['car'],
                                style: TextStyles.bodyText1
                                    .copyWith(color: KColor.white),
                              ),
                              Text(
                                items[index]['package'],
                                style: TextStyles.bodyText3
                                    .copyWith(color: KColor.white),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          items[index]['price'],
                          style: TextStyles.headline3
                              .copyWith(color: KColor.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: KColor.white,
                boxShadow: const [
                  BoxShadow(
                    color: KColor.borderColor,
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(1, 1),
                  ),
                ],
                border: const Border(
                    top: BorderSide(width: 0.5, color: KColor.black),
                    bottom: BorderSide(width: 0.5, color: KColor.black)),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: KButton(
                    title: "Add Vehicle",
                    textColor: KColor.black,
                    textStyle: TextStyles.bodyText1
                        .copyWith(fontWeight: FontWeight.w700),
                    color: KColor.white,
                    height: 48,
                    onPressedCallback: () {},
                  )),
                  const VerticalDivider(
                    color: KColor.black,
                    indent: 1,
                    endIndent: 1,
                  ),
                  Expanded(
                      child: KButton(
                    color: KColor.white,
                    title: "Add Classic",
                    textStyle: TextStyles.bodyText1.copyWith(
                        fontWeight: FontWeight.w700, color: KColor.black),
                    height: 48,
                    onPressedCallback: () {},
                  ))
                ],
              ),
            ),
            Container(
              color: KColor.primary,
              width: context.screenWidth * 1,
              height: context.screenHeight * 0.17,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Add Tips for Washer",
                      style:
                          TextStyles.bodyText1.copyWith(color: KColor.white)),
                  Divider(color: KColor.white, thickness: 1),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: Wrap(
                            spacing: 10,
                            children: List.generate(
                              tips.length,
                              (index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedAmount = index;
                                  });
                                },
                                child: Chip(
                                  backgroundColor: KColor.primary,
                                  side: BorderSide(
                                    color: selectedAmount == tips[index]['id']
                                        ? KColor.white
                                        : KColor.primary,
                                  ),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 0,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(tips[index]['title'],
                                            style: TextStyles.bodyText1
                                                .copyWith(color: KColor.white)),
                                        Text("\$${tips[index]['amount']}",
                                            style: TextStyles.bodyText1
                                                .copyWith(color: KColor.white)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: context.screenWidth * 1,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            color: KColor.black,
            child: Text(
              "Total Order: \$90.50",
              style: TextStyles.headline3.copyWith(color: KColor.white),
            ),
          ),
          Row(
            children: [
              KButton(
                title: "WASH LATER",
                alignment: true,
                radius: 0,
                textStyle: TextStyles.bodyText1.copyWith(color: KColor.white),
                width: context.screenWidth * 0.5,
                height: 45,
                color: KColor.primary,
                onPressedCallback: () {},
              ),
              KButton(
                title: "WASH NOW",
                alignment: true,
                radius: 0,
                textStyle: TextStyles.bodyText1.copyWith(color: KColor.white),
                width: context.screenWidth * 0.5,
                height: 45,
                color: const Color(0xff1083A9),
                onPressedCallback: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
