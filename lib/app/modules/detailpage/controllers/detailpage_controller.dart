import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';

class DetailpageController extends GetxController {

  String  imagePath ='';
  RxList<dynamic> recognitions = [].obs;
  @override
  void onInit() async{
  
    super.onInit();
  imagePath= Get.arguments;
  ModelInit();
Identifydisease(imagePath);
  }
 
// ignore: non_constant_identifier_names
ModelInit() async{
    await Tflite.loadModel(
  model: "assets/models/applediseasemodel.tflite",
  labels: "assets/label/apple.txt",
  numThreads: 1, // defaults to 1
  isAsset: true, // defaults to true, set to false to load resources outside assets
  useGpuDelegate: false // defaults to false, set to true to use GPU delegate
);
}

// ignore: non_constant_identifier_names
Identifydisease( String photopath) async{
 recognitions.value = (await Tflite.runModelOnImage(
  path: photopath,   // required
  imageMean: 0.0,   // defaults to 117.0
  imageStd: 255.0,  // defaults to 1.0
  numResults: 2,    // defaults to 5
  threshold: 0.2,   // defaults to 0.1
  asynch: true      // defaults to true
))!;

print(recognitions[0]['label']);

       }


 
  
}
