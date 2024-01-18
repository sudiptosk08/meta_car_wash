import 'package:flutter/material.dart';
import 'package:meta_car_wash/constant/navigation_service.dart';
import 'package:meta_car_wash/features/add_vehicles_type_page/add_vehicles_type_page.dart';
import 'package:meta_car_wash/features/select_package_page/select_package_page.dart';
import 'package:meta_car_wash/global_component/appBar/app_bar.dart';
import 'package:meta_car_wash/global_component/buttons/Kdrop_down_field.dart';
import 'package:meta_car_wash/utils/assets/app_assets.dart';
import 'package:meta_car_wash/utils/colors/app_colors.dart';
import 'package:meta_car_wash/utils/extension/extension.dart';
import 'package:meta_car_wash/utils/size/k_size.dart';
import 'package:meta_car_wash/utils/text_styles/text_styles.dart';

class SelectVehiclesPage extends StatefulWidget {
  const SelectVehiclesPage({super.key});

  @override
  State<SelectVehiclesPage> createState() => _SelectVehiclesPageState();
}

class _SelectVehiclesPageState extends State<SelectVehiclesPage> {
  List<ItemModel> items = List.generate(
    10,
    (index) => ItemModel(
      title: 'Rolls Royce $index',
      imageUrl: AppAssets.car, // Replace with your image URLs
    ),
  );

  Set<int> selectedItems = Set<int>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: KAppBar(
          title: "Select Vehicles",
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 260,
              child: Text(
                "Bundle Two or More Vehicles Save \$1.00 on Each",
                textAlign: TextAlign.center,
                style: TextStyles.bodyText1,
              ),
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
                      : null,
                  title: Text(items[index].title),
                  leading: Image.asset(
                    items[index].imageUrl,
                    width: 64,
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: KButton(
              title: "Add new vehicle",
              alignment: true,
              textStyle: TextStyles.bodyText1.copyWith(color: KColor.black),
              width: 200,
              height: 40,
              radius: 30,
              color: KColor.primary,
              onPressedCallback: () {
                NavigationService.navigateTo(
                    SlideLeftRoute(page: const AddVehiclesTypePage()));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: KSize.getHeight(context, 10.0)),
            child:
                const Text("Pricing based on location and vehicle make/model."),
          ),
          KButton(
            title: "Next   ",
            alignment: true,
            textStyle: TextStyles.bodyText1.copyWith(color: KColor.white),
            width: KSize.getWidth(context, 250),
            height: 45,
            radius: 30,
            color: KColor.primary,
            trailingTitleIcon: Icon(
              Icons.arrow_forward_outlined,
              color: KColor.white,
              size: 20,
            ),
            onPressedCallback: () {
              NavigationService.navigateTo(
                  SlideLeftRoute(page: const SelectPackagePage()));
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class ItemModel {
  final String title;
  final String imageUrl;

  ItemModel({
    required this.title,
    required this.imageUrl,
  });
}
