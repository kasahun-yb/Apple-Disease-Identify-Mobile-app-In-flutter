import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detailpage_controller.dart';

// ignore: must_be_immutable
class DetailpageView extends GetView<DetailpageController> {

  final _controller=Get.put(DetailpageController());


  DetailpageView({super.key});

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
    
      body:  
       SingleChildScrollView(
         child: Column(
          children: [
              Stack(
                children: [
                  Container(
                  decoration: const BoxDecoration(borderRadius: BorderRadius.only(
                    bottomLeft:Radius.circular(10) ,
                    bottomRight:Radius.circular(10) ,
                  )),
              width:  size.width,
              height: size.width,
              child: _controller.imagePath!=''? Image.file(
                
                 File(_controller.imagePath),fit: BoxFit.cover,)
                 :const Center(child: Text("no Image Selected",style: TextStyle(fontSize: 19),)),
                         ),
                         Positioned(
                          top: 50,
                          left: 16,
                          child: Container(
                            padding: const EdgeInsets.only(left: 5),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                              shape: BoxShape.circle),
                            width: 40,
                            height: 40,
         
                            child: Center(child: IconButton(icon:const Icon(Icons.arrow_back_ios ,color: Colors.black,),onPressed: ()=>{
                              Get.back()
                            },))))
                ],
              )  ,
             
             
             Obx(() => 
             Column(
               children: [
               const SizedBox(height: 21,),
                 Text("Identified Disease is ${_controller.recognitions[0]['label'].toString()}",
                 style: Theme.of(context).textTheme.bodyLarge,
                 ),
              
                  // Text("Identified Disease is ${_controller.recognitions[1]['confidence'].toString()}")
              
               ],
             ),
         ),
         
               CupertinoButton.filled(child:const Text("Save "), onPressed: ()=>{
               
               })
          ],
               ),
       )
     
    );
  }
}
