import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meta_car_wash/constant/navigation_service.dart';
import 'package:meta_car_wash/features/validation_code_page/validation_page.dart';
import 'package:meta_car_wash/utils/assets/app_assets.dart';
import 'package:meta_car_wash/utils/colors/app_colors.dart';
import 'package:meta_car_wash/utils/extension/extension.dart';
import 'package:meta_car_wash/utils/size/k_size.dart';
import 'package:meta_car_wash/utils/text_styles/text_styles.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  var isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: context.screenWidth,
          height: context.screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                "What's the code ?",
                style:
                    TextStyles.bodyText1.copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                "We'll send a text code to verify your phone ",
                style: TextStyles.bodyText2,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: KSize.getWidth(context, 300),
                color: KColor.gray,
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        // Country Flag
                        Image.asset(
                          AppAssets.flag,
                          width: 28,
                          height: 28,
                        ),
                        const SizedBox(width: 10),
                        // Country Code
                        Text(
                            '+1 ', // Replace with the country code as per your requirement
                            style: TextStyles.bodyText1),
                        const SizedBox(
                          width: 2,
                          height: 26,
                          child: VerticalDivider(
                            color: KColor.black,
                            thickness: 1,
                            indent: 1,
                            endIndent: 1,
                            width: 5,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),

                        SizedBox(
                          width: KSize.getWidth(context, 210),
                          child: TextFormField(
                            showCursor: false,
                            keyboardType: TextInputType.number,
                            style: TextStyles.bodyText1.copyWith(height: 0.7),
                            decoration: InputDecoration(
                              //labelStyle: ,//TextStyles.lightRubik16Gray94,
                              hintText: " Enter Phone Number",
                              hintStyle: TextStyles.bodyText1
                                  .copyWith(color: KColor.greyText),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: KSize.getWidth(context, 40),
                  ),
                  SizedBox(
                    height: 16,
                    width: 13,
                    child: Checkbox(
                      value: isCheck,
                      // visualDensity: VisualDensity.comfortable,
                      activeColor: KColor.primary,
                      checkColor: KColor.white,

                      side: const BorderSide(color: KColor.gray),
                      onChanged: (value) {
                        setState(() {
                          isCheck = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: KSize.getWidth(context, 10),
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: "I agree the meta car wash's ",
                      style: TextStyles.bodyText2.copyWith(
                          color: KColor.greyText), // Set the initial text color
                      children: [
                        TextSpan(
                          text: '\nterms&conditions',
                          style: TextStyles.bodyText2.copyWith(
                            color: KColor
                                .persianBlue, // Set the color for the tappable text
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle the tap event, for example, show a dialog or navigate to another screen.
                              print('Terms & Conditions tapped');
                            },
                        ),
                        TextSpan(
                          text: '  and ',
                          style: TextStyles.bodyText2.copyWith(
                              color: KColor.greyText), // Set the text color
                        ),
                        TextSpan(
                          text: ' privacy policy',
                          style: TextStyles.bodyText2.copyWith(
                              color: KColor.persianBlue), // Set the text color
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          NavigationService.navigateTo(
              SlideLeftRoute(page: const ValidationPage()));
        },
        child: CircleAvatar(
          radius: 30,
          backgroundColor: KColor.primary,
          child: Icon(
            Icons.arrow_forward,
            color: KColor.white,
          ),
        ),
      ),
    );
  }
}
