



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../utils/helpers.dart';

class DonateController extends GetxController {

  var isLoading = false.obs;
  bool get loadingStatus => isLoading.value;

  void addDonateData(String name, String project, String amount, String city, String transactionID) async {

    isLoading.value = true;
    try{
      DocumentReference ref = FirebaseFirestore.instance.collection("donate").doc();
      await FirebaseFirestore.instance.collection('donate').doc(ref.id).set({
        "id": ref.id.toString(),
        "name": name,
        "project": project,
        "amount": amount,
        "city": city,
        "transactionID": transactionID,
      });
      isLoading.value = false;
    }catch(e){
      errorToast("Error Occurred", e.toString());
      isLoading.value = false;
    }
  }

}