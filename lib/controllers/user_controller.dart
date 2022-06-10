

import 'package:PLF/models/user_model.dart';
import 'package:PLF/utils/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  bool get loadingStatus => isLoading.value;


  Future<List<UserModel>> getUserData() async {
    isLoading.value = true;
    var val = await FirebaseFirestore.instance.collection("users").get();
    var documents = val.docs;
    List<UserModel> usersList = [];
    if (documents.isNotEmpty) {
      try {
        final data = documents.map((doc) => doc.data()).toList();
        for (int i = 0; i < data.length; i++) {
          usersList.add(UserModel.fromFirestore(Map<String, dynamic>.from(data[i])));
        }
        isLoading.value = false;
        return usersList;
      } catch (e) {
        isLoading.value = false;
        errorToast("Error", e.toString());
        return null;
      }
    }
    isLoading.value = false;
    errorToast("Error", "No Data Found");
    return null;
  }
}