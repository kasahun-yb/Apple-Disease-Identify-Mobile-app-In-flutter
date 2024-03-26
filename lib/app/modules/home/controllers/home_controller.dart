
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {


  RxBool imageSelected=false.obs;
  //the path of identify image 
  RxString imagePath=''.obs;
//this object used to select image from phone device 
final ImagePicker picker = ImagePicker();

//this methods used to select image and give the image path to imagePath variable
 Future selectImage(ImageSource imageSource) async{
 try{
 final image = await picker.pickImage(source:imageSource);
      if(image?.path!=''){
      imagePath.value =image!.path;
      imageSelected.value=true;
      }
      else{
        imagePath.value='';
        imageSelected.value=false;
      }
 }

 catch(e){
    print(e);
 }
}







}
