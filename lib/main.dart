import 'package:e_commerce_project/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor:  Color(0xffFEFEFE),
        scaffoldBackgroundColor: Color(0xffFEFEFE),
        appBarTheme: AppBarTheme(
          backgroundColor:  Color(0xffFEFEFE) ,
        )
        // colorScheme: ColorScheme.fromSeed(
        //
        //   seedColor:AppColor.primaryColor,
        // ),
      ),
      initialRoute: RoutePages.splashScreen,
      getPages: getPages,
    );
  }
}
