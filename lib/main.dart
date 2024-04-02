import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async{
  
 WidgetsFlutterBinding.ensureInitialized();
 String? value='';
 SharedPreferences prefs = await SharedPreferences.getInstance();
 value= prefs.getString('onbording');

  
      initSupabase();
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
      initialRoute: value=='End'? Routes.HOME: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );




}

Future<void> initSupabase() async{

 await Supabase.initialize(
    url: 'https://zkeahfpcvchcxjeowmtf.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InprZWFoZnBjdmNoY3hqZW93bXRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE4Mzk3NjcsImV4cCI6MjAyNzQxNTc2N30.yYah8ri4lDD8DqJl0nDJ-YPWl39POJif7954N0znc5w',
  
  );
}
