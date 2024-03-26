import 'package:apple_disease/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/onbording_controller.dart';

class OnbordingView extends GetView<OnbordingController> {
  


 var _onbordeingController=Get.put(OnbordingController());
  Widget build(BuildContext context) {
     
   var size=   MediaQuery.of(context).size;
     
      List<Widget> pages=[
        const first_onbording_page(),
        const first_onbording_page(),
        const first_onbording_page(),
        const first_onbording_page(),
      ];
    return Scaffold(
   
      body: 
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          
            SizedBox(
              width: size.width,
              height: size.width*1.6,
              child: PageView.builder(
                itemCount: pages.length,
                onPageChanged: (value) {
                  _onbordeingController.pageindex.value=value;
                },
                controller: _onbordeingController.pageController,
                itemBuilder: (context,index){
               
                  return  pages[index];
              
                }),
            ),
                SmoothPageIndicator(
                    controller: _onbordeingController.pageController,
                    count: pages.length,
                    onDotClicked: (index){
                   _onbordeingController.animatedpageChange(_onbordeingController.pageController,index);
                       },

                    effect: ScrollingDotsEffect(
                      activeStrokeWidth: 2.6,
                      activeDotScale: 1.4,
                      activeDotColor:Theme.of(context).colorScheme.primary,
                      dotColor: Theme.of(context).colorScheme.secondaryContainer,
                      maxVisibleDots: 5,
                      radius: 8,
                      spacing: 10,
                      dotHeight: 6,
                      dotWidth: 6,
                    )),
                Obx(()=>
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CupertinoButton(
                          
                          child: _onbordeingController.pageindex.value==0? Text("Skip"):Text("Back"), onPressed: (){
                          _onbordeingController. backChange(_onbordeingController.pageController);
                          }),

                        CupertinoButton(
                          color: Theme.of(context).colorScheme.primary,
                          child: _onbordeingController.pageindex==3?Text("Start"): Text("Next"), onPressed:_onbordeingController.pageindex!=3? (){
                  
                            _onbordeingController. pageChange(_onbordeingController.pageController);
                          }:(){
                            Get.toNamed(Routes.HOME);
                          },)
                      ],
                    ),
                  ),
                ),
                  const SizedBox(height: 10,)
          ],
        
        ),
    
    );
  }
}


 void pagechange(PageController controller,int index){
  controller.animateToPage(index, duration: Duration(milliseconds: 500 ), curve:Curves.easeInToLinear );
 }

class first_onbording_page extends StatelessWidget {
  const first_onbording_page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
       children: [
        const SizedBox(height: 50,),
        Center(
          child: Image.asset
          
          (
          
            'assets/onbording/images.jpg'
            ,width: 150,
            
            ),
        ),
     const SizedBox(height: 50,),
        const Text("Wellcome to this App",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w700,letterSpacing: 1.4),),
       const SizedBox(height: 20,),
         Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 30),
    
          child: Text("This app working to identify apple leave disease using photo fo lefe and machine learign to detect the diseasethis app working to identify apple leave disease using photo fo lefe and machine learign to detect the disease",
    textAlign: TextAlign.justify,
      style: TextStyle(
        color: Theme.of(context).colorScheme.tertiary,
        fontWeight: FontWeight.w500,
       wordSpacing: 1.3,
       letterSpacing: 1.1,
       height: 1.8 ),
       ),
       ),
        
      
      
       ],
        );
  }
}
