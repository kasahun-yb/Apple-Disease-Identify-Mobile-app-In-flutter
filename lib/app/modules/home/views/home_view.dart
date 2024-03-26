import 'dart:io';

import 'package:apple_disease/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  //the controller of homecontroller 
final _controller=Get.put(HomeController());
  @override


  Widget build(BuildContext context) {
    //to get the size of screen
    var size= MediaQuery.of(context).size;
    //scafold 
    return Scaffold(

      //appbar
      appBar: AppBar(
        leading: null,
        title: const Text('Apple Disease Identification'),
        centerTitle: true,
      ),


      body: Obx(()
        => Column(
        
          children: [
            
           SizedBox(
            width:  size.width,
            height: size.width,
            
            child: _controller.imagePath!=''? Image.file(
              
              File(_controller.imagePath.value),fit: BoxFit.cover,):Center(child: Text("no Image Selected",style: TextStyle(fontSize: 19),)),
           ),
           const SizedBox(height: 20
           ,),
           //
            Center(child: CupertinoButton(
                color: Theme.of(context).colorScheme.primary,
            child: const Text(
                "Select Image"
              ), onPressed: (){
            _controller.selectImage(ImageSource.gallery);
              }),
            ),
        
          const SizedBox(height: 20,),
             Center(child: CupertinoButton(
              disabledColor: Theme.of(context).colorScheme.primaryContainer,
                color: Theme.of(context).colorScheme.primary,  onPressed: _controller.imageSelected.value==false?null:()=>{
                Get.toNamed(Routes.DETAILPAGE)
                },
                child: const Text(
                "Identify Disease"
              )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
