
import 'dart:io';

import 'package:apple_disease/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/home_controller.dart';


class AnimationControllere extends GetxController  with GetSingleTickerProviderStateMixin{
  

 
 late AnimationController animationController;
 late Animation<Offset> offsetAnimation;

  @override
  void onInit() {
    super.onInit();
    animationController =
        AnimationController(vsync:this, duration: const Duration(milliseconds: 200));
    offsetAnimation = Tween<Offset>(
      begin: const Offset(-1, 0.0),
      end: const Offset(0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInSine,
      ),
    );
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}


class HomeView extends GetView<HomeController> {
     HomeView({super.key});
  //the controller of homecontroller 
final _controller=Get.put(HomeController());
 final AnimationControllere animationController =
      Get.put(AnimationControllere());


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
drawer:Drawer(
child: SafeArea(
  child: Padding(
    padding: const EdgeInsets.only(left:16.0 ,top:20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.mobile_friendly),
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
          ListTile(
          onTap: ()=>{
          Get.toNamed(Routes.AUTH)
          },
          leading: Icon(Icons.lock),
          title: Text("Login"),
         ),
      ],
    ),
  ),
),
) ,




      body: Obx(()
        => Column(
          children: [
            SizedBox(
            width:  size.width,
            height: size.width,
            // ignore: unrelated_type_equality_checks
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
                color: Theme.of(context).colorScheme.primary,  onPressed: ()=>{

             
              if(controller.imageBlur[0]['label']=='blur'){
               animationController.animationController.forward()
               }
               else{
               Get.toNamed(Routes.DETAILPAGE,arguments: _controller.imagePath.value),
               }
               },
                child: const Text(
                "Identify Disease"
              )
              ),
            ),
           
          
       SlideTransition(
               position: animationController.offsetAnimation,
               child: GestureDetector(
                onTap:(){
                  animationController.animationController.reverse();
                } ,
                 child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                    margin: const EdgeInsets.only(left: 16,right: 16,top: 70),
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 141, 13, 13),
                     borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Column(
                      children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   Icon(Icons.error_sharp,color: Colors.white, ),
                   SizedBox(width: 10,),
                   Text("Warnning",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
                  
                   ],),
                    SizedBox(height: 10,),
                           Text('The above image you inset is blur. If you  this image the result may be undesirable, so change other image or Recapture again. ',style: TextStyle(color: Color.fromARGB(255, 204, 201, 201)),)
                      ],
                    ),
                  ),
               ),
             )
  
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
