import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta_car_wash/constant/navigation_service.dart';
import 'package:meta_car_wash/features/select_location_page/select_location_page.dart';
import 'package:meta_car_wash/global_component/buttons/Kdrop_down_field.dart';
import 'package:meta_car_wash/utils/colors/app_colors.dart';
import 'package:meta_car_wash/utils/extension/extension.dart';
import 'package:meta_car_wash/utils/size/k_size.dart';
import 'package:meta_car_wash/utils/text_styles/text_styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({super.key});

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  int _otpTimer = 60;
  bool _canResend = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_otpTimer > 0) {
          _otpTimer--;
        } else {
          _canResend = true;
          timer.cancel();
        }
      });
    });
  }

  void resendOtp() {
    // Implement your resend OTP logic here
    setState(() {
      _canResend = false;
      _otpTimer = 60;
    });

    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.screenWidth * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "What's the code ?",
              style: TextStyles.bodyText1.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              "Enter the code sent to +1 (845) 301-12547 ",
              style: TextStyles.bodyText2,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: KSize.getWidth(context, 210),
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                onChanged: (value) {},
                onCompleted: (value) {
                  Navigator.pop(context);
                },
                obscureText: false,
                animationType: AnimationType.slide,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  fieldHeight: 65,
                  fieldWidth: KSize.getWidth(context, 40),
                  activeFillColor: KColor.black,
                  inactiveColor: KColor.black,
                  selectedColor: KColor.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Did not get the code ?',
                      style: TextStyles.bodyText2
                          .copyWith(color: KColor.greyText)),
                  const SizedBox(height: 8.0),
                  GestureDetector(
                    onTap: _canResend ? resendOtp : null,
                    child: Text(
                      ' Resend ',
                      style: TextStyles.bodyText2.copyWith(
                          color: _canResend ? KColor.primary : KColor.greyText),
                    ),
                  ),
                  _canResend
                      ? Container()
                      : Text(
                          '( $_otpTimer )',
                          style: TextStyles.bodyText2
                              .copyWith(color: KColor.primary),
                        ),
                ],
              ),
            ),
            const SizedBox(
              height: 110,
            ),
            KButton(
              height: 40,
              radius: 30,
              onPressedCallback: () {
                NavigationService.navigateTo(
                    ScaleRoute(page: const CurrentLocationScreen()));
              },
              width: 245,
              title: "Verify  ",
              textColor: KColor.white,
              trailingTitleIcon: Icon(
                Icons.arrow_forward_ios,
                color: KColor.white,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
