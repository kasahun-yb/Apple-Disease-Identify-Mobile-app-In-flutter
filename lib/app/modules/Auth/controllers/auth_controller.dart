import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController
    final supabase = Supabase.instance.client;

  RxBool issignupProcess = false.obs;



  void userSignup(String Email,String Password) async{
                      issignupProcess.value=true;
               final AuthResponse  res = await supabase.auth.signUp(
                          email:Email,
                          password: Password,
                   
                        channel: OtpChannel.sms
                        ); 


                        if(res.user!=null){
                         print("user succesful registered");
                         issignupProcess.value=false;
                        } 

                        else{
                          issignupProcess.value=false;
                          throw 'user registeration failed';
                          
                        }
                        }

}
