import 'package:flutter/material.dart';
import '../../controllers/donate_controller.dart';
import 'package:get/get.dart';

import '../../utils/ColorScheme.dart';
import '../../utils/helpers.dart';

class DonateDialog extends StatelessWidget {
  final String name, project, amount, city;
  DonateDialog(
      {Key key,
      @required this.name,
      @required this.project,
      @required this.amount,
      @required this.city})
      : super(key: key);

  final transactionController = TextEditingController();
  final DonateController _donateController = Get.put(DonateController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: vibrantOrange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Account Title:     Idara-E-Taleem-O-Agahi",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: black, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Bank Name:     Meezan Bank Pvt Ltd",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: black, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Account No:     4120 9876 3456 1278",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: black, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: transactionController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Enter Transaction ID",
                      fillColor: Colors.white70),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  if(name != null){
                    if(project != null){
                      if(amount != null){
                        if(city != null){
                          if(transactionController.text.isNotEmpty){
                            _donateController.addDonateData(name, project, amount, city,
                                transactionController.text.trim());
                          }else{
                            errorToast("Error", "Add the TransactionID First");
                          }
                        }else{
                          errorToast("Error", "Add the City First");
                        }
                      }else{
                        errorToast("Error", "Add the Amount First");
                      }
                    }else{
                      errorToast("Error", "Select the Project First");
                    }
                  }else{
                    errorToast("Error", "Add the Name First");
                  }

                  Get.back();
                },
                child: Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(bottom: 20, right: 30, left: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: vibrantBlack),
                      child: Obx(() {
                        return _donateController.isLoading.isTrue
                            ? Center(child: CircularProgressIndicator())
                            : Center(
                                child: Text(
                                  "Donate Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'circe',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                              );
                      })),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
