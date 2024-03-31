
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';            
import 'package:flutter_tflite/flutter_tflite.dart';
class HomeController extends GetxController {


  RxBool imageSelected=false.obs;
  //the path of identify image 


  var imageBlur=[].obs;
  RxString imagePath=''.obs;
//this object used to select image from phone device 

      @override
        void onInit() async{
          super.onInit();
          intialize();

        
        }
        @override
        void dispose() async {
          super.dispose();
          await Tflite.close();
        }

    final ImagePicker picker = ImagePicker(); 

//this methods used to select image and give the image path to imagePath variable
      Future selectImage(ImageSource imageSource) async{
      try{
      final image = await picker.pickImage(source:imageSource);
            if(image?.path!=''){
            imagePath.value =image!.path;
           
             idntifyblury(image.path);
            }
            else{
              imagePath.value='';
              imageSelected.value=false;
            } 
            }

   // ignore: empty_catches
   catch(e){

      }
      }
           
    void intialize() async{
          await Tflite.loadModel(
          model: "assets/models/blurmodel.tflite",
          labels: "assets/label/blur.txt",
          numThreads: 1,
          isAsset: true, 
          useGpuDelegate: false 
        );
       }

    Future<List> idntifyblury( String path) async{
      var recognitions = await Tflite.runModelOnImage(
      path: path, 
      imageMean: 0.0,  
      imageStd: 255.0,  
      numResults: 1,  
      threshold: 0.2,  
      asynch: true        
      );
   imageBlur.value=recognitions!;
   if(imageBlur[0]['label']=='blur'){
      imageSelected.value=false;
   }
   else{
      imageSelected.value=true;
   }
   return imageBlur;
   }

}