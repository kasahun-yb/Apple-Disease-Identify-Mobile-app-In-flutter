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
        textTheme:  const TextTheme(
          displayLarge: TextStyle(fontSize: 24, fontFamily:'MyCustomFont' , fontWeight: FontWeight.bold, color: Colors.blue),
          displayMedium: TextStyle(fontSize: 22,fontFamily:'MyCustomFont' ,fontWeight: FontWeight.w600, color: Colors.red),
          displaySmall: TextStyle(fontSize: 20, fontFamily:'MyCustomFont' ,fontWeight: FontWeight.w500, color: Colors.green),
          bodyLarge: TextStyle(fontSize: 16, fontFamily: 'MyCustomFont',color: Colors.black),
          bodyMedium: TextStyle(fontSize: 14, fontFamily:'MyCustomFont' , color: Colors.grey),
        ), 
      colorSchemeSeed: const Color.fromARGB(255, 16, 109, 89), ),
      title: "Apple Disease Identfication",
      initialRoute:AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );

 
  

}
