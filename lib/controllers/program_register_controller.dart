



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../utils/helpers.dart';

class ProgramRegisterController extends GetxController {

  var isLoading = false.obs;
  bool get loadingStatus => isLoading.value;

  void addProgramRegisterData(String name, String email, String city, String type,
      String phoneNo, String project) async {

    isLoading.value = true;
    try{
      DocumentReference ref = FirebaseFirestore.instance.collection("users").doc();
      await FirebaseFirestore.instance.collection('users').doc(ref.id).set({
        "id": ref.id.toString(),
        "name": name,
        "email": email,
        "city": city,
        "phoneNo": phoneNo,
        "type": type,
        "project": project,
      });
      isLoading.value = false;
    }catch(e){
      errorToast("Error Occurred", e.toString());
      isLoading.value = false;
    }
  }

}