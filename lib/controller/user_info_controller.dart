import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserInfoController extends GetxController {
  /// <================================= User info  ===============================> ///
  final formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController(text: 'Md Bayzid hosen');
  final emailCtrl = TextEditingController(text: 'mdbayazid131@gmail.com');
  final phoneCtrl = TextEditingController(text: '+880 1990641482');
  final countryCtrl = TextEditingController(text: 'Bangladesh');
  final cityCtrl = TextEditingController(text: 'Faridpur');
  final addressCtrl = TextEditingController(text: 'Faridpur sador, Faridpur');

  RxString imagePath=''.obs;
Future getImage() async {
 final ImagePicker picker = ImagePicker();
 final image= await picker.pickImage(source: ImageSource.gallery);

 if(image != null){
imagePath.value= image.path.toString();
 }
}

}
