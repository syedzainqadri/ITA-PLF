

import 'package:PLF/utils/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/banner_model.dart';

class GetHomeBottomBannerController extends GetxController {
  var isLoading = false.obs;
  bool get loadingStatus => isLoading.value;


  Future<List<BannersModel>> getHomeBottomBanner() async {
    isLoading.value = true;
    var val = await FirebaseFirestore.instance.collection("homeBottomBanner").get();
    var documents = val.docs;
    List<BannersModel> eventList = [];
    if (documents.isNotEmpty) {
      try {
        final data = documents.map((doc) => doc.data()).toList();
        for (int i = 0; i < data.length; i++) {
          eventList.add(BannersModel.fromFireStore(Map<String, dynamic>.from(data[i])));
        }
        isLoading.value = false;
        return eventList;
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