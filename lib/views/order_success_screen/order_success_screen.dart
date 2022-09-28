import 'package:PLF/utils/ColorScheme.dart';
import 'package:PLF/views/Home/Widgets/home_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vibrantAmber,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart,
                color: white,
                size: 60,
              ),
              SizedBox(
                height: 20,
              ),
              Text("Order Placed Successfully"),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  Get.offAll(HomeNavbar());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(bottom: 20, right: 30, left: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: vibrantOrange),
                  child: Center(
                    child: Text(
                      "Continue To Shop",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'circe',
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
