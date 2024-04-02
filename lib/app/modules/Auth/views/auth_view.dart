import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _controller=Get.put(AuthController());
    RxBool isshow=true.obs;
      final formKey = GlobalKey<FormState>();
        String? email = '';
       String? password = '';


    return  Scaffold(
     
      body:  SingleChildScrollView(
        child: Obx(
          ()=> Column(
            children: [
               Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
               width: double.infinity,
               height: 200,
               color: Theme.of(context).primaryColor,
               child:  const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Text("Sign up to your \nAccount",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 29,color: Colors.white))
               ,
               SizedBox(height: 10,),
               Text("Welcome to Sign up page",style: TextStyle( 
                fontSize: 17,color: Color.fromARGB(195, 255, 255, 255)
               ),),
               SizedBox(height: 20,),
               ]), 
               ),
               Form(
                key: formKey,
                child: 
                 Padding(
                 padding: const EdgeInsets.only(left: 16.0,right: 16,top: 20,bottom: 10),
                 child: Column(
                  children: [
                    TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration:  const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                      border: OutlineInputBorder(
                        
                      ),
                      
                   
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      email = value;
                    },
                  ),
                  const SizedBox(height: 25,),
                  TextFormField(
                    
                    obscureText: isshow.value,
                    
                    decoration:   InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                     suffix: InkWell(
                      onTap: ()=>{
                        isshow.value=!isshow.value,
                      },
                      child: Icon( isshow.value? Icons.visibility:Icons.visibility_off)),
                    border: const OutlineInputBorder(

                      // borderRadius: BorderRadius.circular(20)
                      
                    ),
                     
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      password = value;
                    },
                  ),
                 
                    ],
                             ),
               )),
                const SizedBox(
                  height: 16,
                ),
                
               Padding(
                 padding:  const EdgeInsets.all(16.0),
                 child: GestureDetector(
                  onTap: () async {
                     if (formKey.currentState!.validate()) {
                      formKey.currentState?.save();
                      _controller.userSignup(email.toString(), password.toString());
                    }
                  },
                   child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5)),
                    child:  Center(
                      child: 
                    
                  _controller.issignupProcess.value==false?  const Text("Sign in",style:  TextStyle(fontWeight: FontWeight.w300,color: Colors.white),):Container(child: LoadingAnimationWidget.flickr(leftDotColor: Colors.red,rightDotColor: Colors.black,size: 21),)
                  
                  ),
                  
                   ),
                 ),
               ),
               const SizedBox(height: 21,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text("Already have an Account?",style: TextStyle( color: Color.fromARGB(220, 0, 0, 0)),),
              const SizedBox(width: 5,),
               InkWell(
                onTap: (){

                }
                ,
                child: Text("Sign in",style: TextStyle(fontSize: 16,color: Theme.of(context).primaryColor),),
              )
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
