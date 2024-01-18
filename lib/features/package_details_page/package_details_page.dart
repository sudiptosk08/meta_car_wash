import 'package:flutter/material.dart';
import 'package:meta_car_wash/utils/assets/app_assets.dart';
import 'package:meta_car_wash/utils/colors/app_colors.dart';
import 'package:meta_car_wash/utils/extension/extension.dart';
import 'package:meta_car_wash/utils/text_styles/text_styles.dart';

class PackageDetailsPage extends StatefulWidget {
  String title;
  PackageDetailsPage({required this.title, super.key});

  @override
  State<PackageDetailsPage> createState() => _PackageDetailsPageState();
}

class _PackageDetailsPageState extends State<PackageDetailsPage> {
  List<String> productDetailsFeatures = [
    "Complete exterior hand wash ",
    "Wipe down all door jambs & trunk seals ",
    "Vacuum seats, carpets & floor mats",
    "Clean windows inside & out ",
    "Rim cleaning & tire dressing ",
    "Thorough wipe down of interior, including dashboard, door panels, center console, pillars & trim pieces",
    "Dressing of all exterior plastics",
    "Light stain removal of interior (excluding carpet)",
    "Leather cleaning & conditioning"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: KColor.primary),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 4.0, top: 2, bottom: 2),
                        child: Image.asset(
                          AppAssets.logo,
                          height: 60,
                          width: 60,
                          color: KColor.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${widget.title} Wash",
                  style: TextStyles.headline2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: context.screenWidth * 1,
                  padding: const EdgeInsets.all(15),
                  color: KColor.primary,
                  child: Text(
                    "Our Preminu Details Package goes abouve and beyond to satisfy your highest level of expectations and also the most affordaable in the industry brought directly to your doorstep in minutes.",
                    textAlign: TextAlign.justify,
                    style: TextStyles.bodyText1.copyWith(color: KColor.white),
                  ),
                ),
                ...List.generate(
                    productDetailsFeatures.length,
                    (ind) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.check,
                                color: KColor.primary,
                                size: 22,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Text(
                                  productDetailsFeatures[ind],
                                  maxLines: 2,
                                  style: TextStyles.bodyText1
                                      .copyWith(color: KColor.black),
                                ),
                              )
                            ],
                          ),
                        )),
              ],
            ),
            Positioned(
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)))
          ],
        ),
      ),
    );
  }
}
