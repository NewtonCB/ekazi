import 'package:ekazi/splashScreen/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dashboard/components/swiper_adds/swiper_controller.dart';
import 'dashboard/components/swiper_adds/swiper_model.dart';
import 'login/login_view.dart';
import 'package:ekazi/dashboard/main_view/main_dash.dart';

void main() {
  final SwiperController swiperController = Get.put(SwiperController());
  swiperController.setImages([
    ImageModel(imagePath: 'assets/adds/think1.jpg'),
    ImageModel(imagePath: 'assets/adds/above_beyond1.jpg'),
    ImageModel(imagePath: 'assets/adds/exact_add1.jpg'),
    // ImageModel(imagePath: 'assets/adds/ad_4.jpg'),
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690), // Base design size
      minTextAdapt: true, // Allow text to scale
      splitScreenMode: true, // Split screen support
      builder: (context, child) {
        return   GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ekazi',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFDDE4E4)
            ),
          ),
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => SplashScreen()),
            GetPage(name: '/login', page: () => LoginPage()),
            GetPage(name: '/dashboard', page: () => Dashboard()),
          ],
        );
      },
    );
  }

}
