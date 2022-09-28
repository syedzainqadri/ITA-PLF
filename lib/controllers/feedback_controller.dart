



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../utils/helpers.dart';

class FeedbackController extends GetxController {

  var isLoading = false.obs;
  bool get loadingStatus => isLoading.value;

  void addFeedbackData(String project, String remarks, double rating) async {

    isLoading.value = true;
    try{
      DocumentReference ref = FirebaseFirestore.instance.collection("feedback").doc();
      await FirebaseFirestore.instance.collection('feedback').doc(ref.id).set({
        "id": ref.id.toString(),
        "project": project,
        "remarks": remarks,
        "rating": rating,
      });
      isLoading.value = false;
    }catch(e){
      errorToast("Error Occurred", e.toString());
      isLoading.value = false;
    }
  }

}