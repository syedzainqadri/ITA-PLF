

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/program_model.dart';
import '../utils/helpers.dart';

class ProgramController extends GetxController {

  var isLoading = false.obs;
  var isLoadingPrograms = false.obs;
  bool get loadingStatus => isLoading.value;


  Future<ProgramModel> getProgramData(String id) async {
    isLoading.value = true;
    var val = await FirebaseFirestore.instance.collection("program").doc(id).get();
    var documents = val.data();

    if (documents.isNotEmpty) {
      try {
        ProgramModel programData = ProgramModel.fromFireStore(Map<String, dynamic>.from(documents));
        isLoading.value = false;
        return programData;
      } catch (e) {
        isLoading.value = false;
        errorToast("Error", e.toString());
        return null;
      }
    }
    isLoading.value = false;
    errorToast("Error", "No Program Found");
    return null;
  }

  Future<List<ProgramModel>> getProgramsData() async {
    isLoadingPrograms.value = true;
    var val = await FirebaseFirestore.instance.collection("program").get();
    var documents = val.docs;
    List<ProgramModel> programList = [];
    if (documents.isNotEmpty) {
      try {
        final data = documents.map((doc) => doc.data()).toList();
        for(int i=0; i<data.length; i++){
          programList.add(ProgramModel.fromFireStore(Map<String, dynamic>.from(data[i])));
        }
        isLoadingPrograms.value = false;
        return programList;
      } catch (e) {
        isLoadingPrograms.value = false;
        errorToast("Error", e.toString());
        return null;
      }
    }
    isLoadingPrograms.value = false;
    errorToast("Error", "No Program Found");
    return null;
  }

}