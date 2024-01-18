import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta_car_wash/constant/navigation_service.dart';
import 'package:meta_car_wash/global_component/appBar/app_bar.dart';
import 'package:meta_car_wash/global_component/buttons/Kdrop_down_field.dart';
import 'package:meta_car_wash/utils/assets/app_assets.dart';
import 'package:meta_car_wash/utils/colors/app_colors.dart';
import 'package:meta_car_wash/utils/extension/extension.dart';
import 'package:meta_car_wash/utils/size/k_size.dart';
import 'package:meta_car_wash/utils/text_styles/text_styles.dart';

class AddNewVehiclesPage extends StatefulWidget {
  String title;
  AddNewVehiclesPage({super.key, required this.title});

  @override
  State<AddNewVehiclesPage> createState() => _AddNewVehiclesPageState();
}

class _AddNewVehiclesPageState extends State<AddNewVehiclesPage> {
  List<Map<String, String>> vehicles = [
    {"name": "Rolls Royce", "model": "Thanom"},
    {"name": "ACURA", "model": "v2023"},
    {"name": "Audi ", "model": "A1 Ambition"},
    {"name": "Bentley", "model": "v2023"},
    {"name": "Abarth", "model": "Jaguar"},
    {"name": "Buick", "model": "2140"},
    {"name": "Cadillac", "model": "Lexus"},
    {"name": "Dodge", "model": "v2023"},
    {"name": "Fiat", "model": "Jeep"},
    {"name": "Ford", "model": "Lamborghini"},
  ];
  var selectedVehiclesName = "";
  var selectedVehiclesModel = "";
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: KAppBar(
          title: "Add ${widget.title}",
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: KSize.getHeight(context, 510),
                          decoration: BoxDecoration(
                              color: KColor.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0))),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                /// Task Type List
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ...List.generate(vehicles.length, (index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedVehiclesName =
                                                vehicles[index]["name"]
                                                    .toString();
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          height: 50,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 12),
                                          decoration: BoxDecoration(
                                              color: KColor.white,
                                              border: const Border(
                                                  bottom: BorderSide(
                                                      color:
                                                          KColor.borderColor)),
                                              borderRadius:
                                                  BorderRadius.circular(0)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                vehicles[index]["name"]
                                                    .toString(),
                                                style: TextStyles.bodyText2
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: KColor.greyText),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 8),
                    padding: EdgeInsets.symmetric(
                        horizontal: KSize.getWidth(context, 16), vertical: 12),
                    decoration: BoxDecoration(
                      color: KColor.textfieldgrey,
                      border: Border.all(width: 2, color: KColor.primary),
                      boxShadow: [
                        BoxShadow(
                            color: KColor.white.withOpacity(0.1),
                            blurRadius: 2,
                            spreadRadius: 0,
                            offset: const Offset(0, 1))
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              selectedVehiclesName.isNotEmpty
                                  ? selectedVehiclesName.toString()
                                  : "Select ${widget.title} Type Vehicles Make",
                              style: TextStyles.bodyText1
                                  .copyWith(color: KColor.black),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.expand_more_outlined,
                          color: KColor.black,
                        )
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: KSize.getHeight(context, 510),
                          decoration: BoxDecoration(
                              color: KColor.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0))),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ...List.generate(vehicles.length, (index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedVehiclesModel =
                                                vehicles[index]["model"]
                                                    .toString();
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          height: 50,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 12),
                                          decoration: BoxDecoration(
                                              border: const Border(
                                                  bottom: BorderSide(
                                                      color:
                                                          KColor.borderColor)),
                                              color: KColor.white,
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                vehicles[index]["model"]
                                                    .toString(),
                                                style: TextStyles.bodyText2
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: KColor.greyText),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 8),
                    padding: EdgeInsets.symmetric(
                        horizontal: KSize.getWidth(context, 16), vertical: 12),
                    decoration: BoxDecoration(
                      color: KColor.textfieldgrey,
                      border: Border.all(width: 2, color: KColor.primary),
                      boxShadow: [
                        BoxShadow(
                            color: KColor.white.withOpacity(0.1),
                            blurRadius: 2,
                            spreadRadius: 0,
                            offset: const Offset(0, 1))
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              selectedVehiclesModel.isNotEmpty
                                  ? selectedVehiclesModel.toString()
                                  : "Select ${widget.title} Type Vehicles Model",
                              style: TextStyles.bodyText1
                                  .copyWith(color: KColor.black),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.expand_more_outlined,
                          color: KColor.black,
                        )
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'If your vehicles was not found, please enter it on this  ',
                      style: TextStyles.bodyText1.copyWith(color: KColor.black),
                    ),
                    TextSpan(
                      text: 'form',
                      style: TextStyles.bodyText1.copyWith(
                        color: Colors.blue, // Customize the color as needed
                        decoration: TextDecoration.underline, // Add underline
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // NavigationService.navigateTo(FadeRoute(page: ));
                          // print('Form tapped!');
                        },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  pickImage(ImageSource.camera);
                },
                child: Container(
                  width: context.screenWidth,
                  decoration: const BoxDecoration(
                    color: KColor.black,
                  ),
                  child: image == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.camera,
                              width: 120,
                              height: 120,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Add Vehicles Photo',
                              style: TextStyles.bodyText2.copyWith(
                                  color: KColor.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '( Optional )',
                              style: TextStyles.bodyText2.copyWith(
                                  color: KColor.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      : Image.file(
                          image!,
                          height: 175,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: KButton(
        title: "Add New Morder Vehicles",
        alignment: true,
        textStyle: TextStyles.bodyText1.copyWith(color: KColor.white),
        width: double.infinity,
        height: 50,
        radius: 0,
        color: KColor.primary,
        onPressedCallback: () {},
      ),
    );
  }

  text(String title) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: title == "Condition" || title == "Authenticity" ? 0 : 10),
      child: Text(
        title,
        style: TextStyles.subTitle.copyWith(
            color: KColor.black, fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
  }
}

class Features {
  final int id;
  final String name;

  Features({
    required this.id,
    required this.name,
  });
}
