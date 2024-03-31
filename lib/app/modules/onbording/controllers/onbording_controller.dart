import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnbordingController extends GetxController {

       RxInt pageindex=0.obs;
PageController pageController=PageController(initialPage:0);

 
 void animatedpageChange(PageController controller,int index){
  pageindex.value=index;
  controller.animateToPage(index, duration: const Duration(milliseconds: 300 ), curve:Curves.easeInToLinear );
 }
  void pageChange(PageController controller){
   controller.nextPage(duration: const Duration(milliseconds: 300 ), curve:Curves.easeInToLinear);
 }
 void backChange(PageController controller){
  int backpageindex=0;
  if(pageindex.value==0){
backpageindex=0;
controller.animateToPage(backpageindex,
    duration: const Duration(milliseconds: 300 ), curve:Curves.easeInToLinear);
  }
  else{
    var backpageindex=pageindex.value-1;
    controller.animateToPage(backpageindex,
    duration: const Duration(milliseconds: 300 ), curve:Curves.easeInToLinear);
  }
   
 }
Future<void> saveData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('onbording', 'End'); // Example of saving a string
}

}
