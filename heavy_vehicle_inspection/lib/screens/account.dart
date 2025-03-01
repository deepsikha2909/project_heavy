// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heavy_vehicle_inspection/DB%20service/customer_login.dart';
import 'package:heavy_vehicle_inspection/constants/theme.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  CutomerLogInData customerdatainaccount = Get.put(CutomerLogInData());

  List<Map<String, dynamic>> postcustomerDataList = [];

  Future<void> allcustomerposts() async {
    final allcustomerpostinaacount =
        await customerdatainaccount.getallcustomerlogindetails();
    setState(() {
      postcustomerDataList = allcustomerpostinaacount;
    });
  }

  @override
  void initState() {
    super.initState();
    allcustomerposts();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Hwhite,
      appBar: AppBar(
        backgroundColor: Hwhite,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Hblack,
          ),
        ),
      ),
      body: Container(
        height: screenSize.height * 0.2,
        width: screenSize.width * 0.8,
        decoration: BoxDecoration(
          color: Hwhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Hblack.withOpacity(0.06),
              blurRadius: 15,
              spreadRadius: 0.5,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: postcustomerDataList.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postcustomerDataList[index]['name'].toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Hblue,
                    ),
                  ),
                  Text(
                    postcustomerDataList[index]['email'].toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Hblue.withOpacity(0.3),
                    ),
                  ),
                  Text(
                    postcustomerDataList[index]['phonenumber'].toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Hblue.withOpacity(0.3),
                    ),
                  ),
                  Text(
                    postcustomerDataList[index]['specialist'].toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Hblue.withOpacity(0.3),
                    ),
                  ),
                  Text(
                    postcustomerDataList[index]['location'].toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Hblue.withOpacity(0.3),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
