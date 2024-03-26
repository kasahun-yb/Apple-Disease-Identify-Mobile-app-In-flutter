import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/routes/app_pages.dart';

void main() async{
// SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? value = prefs.getString('onbording'); // Example of retrieving a string

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      colorSchemeSeed: Color.fromARGB(255, 16, 109, 89), ),
      title: "Apple Disease Identfication",
      initialRoute:AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );

 
  

}
