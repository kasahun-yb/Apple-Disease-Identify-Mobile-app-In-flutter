import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        // ignore: prefer_const_constructors
        colorSchemeSeed: Color.fromARGB(255, 16, 109, 89),
        
      ),
      title: "Apple Disease Identfication",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
