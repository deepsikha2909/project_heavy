import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heavy_vehicle_inspection/DB%20service/login_db.dart';
import 'package:heavy_vehicle_inspection/constants/theme.dart';

class AdminAccountPage extends StatefulWidget {
  const AdminAccountPage({super.key});

  @override
  State<AdminAccountPage> createState() => _AdminAccountPageState();
}

class _AdminAccountPageState extends State<AdminAccountPage> {
  LogInData datainaccount = Get.put(LogInData());

  List<Map<String, dynamic>> postDataList = [];

  Future<void> allcustomerposts() async {
    final allpostinaacount = await datainaccount.getalllogindetails();
    setState(() {
      postDataList = allpostinaacount;
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
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView.builder(
          itemCount: postDataList.length,
          itemBuilder: (context, index) {
            return Container(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      postDataList[index]['name'].toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Hblack,
                      ),
                    ),
                    Text(
                      postDataList[index]['email'].toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Hblue,
                      ),
                    ),
                    Text(
                      postDataList[index]['phonenumber'].toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Hblack.withOpacity(0.3),
                      ),
                    ),
                    Text(
                      postDataList[index]['specialist'].toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Hblack.withOpacity(0.3),
                      ),
                    ),
                    Text(
                      postDataList[index]['location'].toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Hblack.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
