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
        



        title: const Text('Apple Disease Identification'),
        centerTitle: true,
      ),
drawer: Drawer(
child: SafeArea(
  child: Padding(
    padding: const EdgeInsets.only(left:16.0 ,top:20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.mobile_friendly),
         ProfileMode(Theme.of(context).textTheme.bodyLarge!,) ,
         const SizedBox(height: 10,),
         const Divider(
          color: Color.fromARGB(10, 0, 0, 0),
         ),

         const ListTile(
          leading: Icon(Icons.settings),
          title: Text("setting"),
         ),
      
         const ListTile(
          leading: Icon(Icons.bookmark),
          title: Text("Saved"),
         ),
        
          const ListTile(
          leading: Icon(Icons.edit),
          title: Text("feedbacks"),
         ),
       
        
         const Divider(
          color: Color.fromARGB(10, 0, 0, 0),
         ),
         const ListTile(
          leading: Icon(Icons.lock),
          title: Text("Login"),
         ),
      ],
    ),
  ),
),
),

      body: Obx(()
        => Column(
        
          children: [
            SizedBox(
            width:  size.width,
            height: size.width,
            child: _controller.imagePath!=''? Image.file(
              File(_controller.imagePath.value),fit: BoxFit.cover,):const Center(child: Text("no Image Selected",style: TextStyle(fontSize: 19),)),
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
                Get.toNamed(Routes.DETAILPAGE,arguments: _controller.imagePath.value)
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
  
 // ignore: non_constant_identifier_names
 Widget ProfileMode(TextStyle style) {
  // ignore: avoid_unnecessary_containers
  return Container(
    child:  Row(
      children: [
    const   CircleAvatar(
      radius: 30,
      
   backgroundImage: NetworkImage('https://images.pexels.com/photos/428364/pexels-photo-428364.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      ) ,
     const SizedBox(width: 20,),
    Text("Guet",style:style ),

    ]),
  );
 }
}
