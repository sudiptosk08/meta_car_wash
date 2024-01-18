import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta_car_wash/constant/logger.dart';
import 'package:meta_car_wash/constant/navigation_service.dart';
import 'package:meta_car_wash/constant/shared_preference_constant.dart';
import 'package:meta_car_wash/features/intro_page/intro_page.dart';
import 'package:meta_car_wash/utils/colors/app_colors.dart';
import 'package:nb_utils/nb_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  await initialize(); // initializing getStorage
  runApp(ProviderScope(observers: [Logger()], child: const MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  bool checkLogin = getBoolAsync(isLoggedIn, defaultValue: false);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.navigatorKey,
        title: 'Meta CarWash',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
            backgroundColor: KColor.background,
            iconTheme: IconThemeData(color: KColor.black),
          ),
        ),
        home: const IntroPage());
  }
}
