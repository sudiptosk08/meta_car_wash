import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta_car_wash/utils/extension/extension.dart';

import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/text_styles/text_styles.dart';

class KDrawer extends ConsumerWidget {
  const KDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        color: KColor.background,
        width: context.screenWidth * 0.75,
        height: context.screenHeight * 1,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    color: KColor.primary,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopify,
                          size: 90,
                          color: KColor.white,
                        ),
                        Text(
                          'E-commerce',
                          style: TextStyles.headline1
                              .copyWith(color: KColor.white),
                        ),
                      ],
                    ),
                  ),
                  drawerItem(() => Navigator.pop(context), Icons.home, "Home"),
                  drawerItem(() => Navigator.pushNamed(context, '/contact'),
                      Icons.shop, "History"),
                  drawerItem(() => Navigator.pushNamed(context, '/contact'),
                      Icons.notification_important_rounded, "Promotion"),
                  drawerItem(() => Navigator.pushNamed(context, '/contact'),
                      Icons.contact_page, "Billing"),
                  drawerItem(() => Navigator.pushNamed(context, '/about'),
                      Icons.error_rounded, "Profile"),
                  drawerItem(() => Navigator.pushNamed(context, '/about'),
                      Icons.rule_folder_sharp, "Log Out"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerItem(VoidCallback onTap, IconData icon, String text) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(
              icon,
              color: KColor.black,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              text,
              style: TextStyles.bodyText1.copyWith(
                color: KColor.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
