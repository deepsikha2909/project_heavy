// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heavy_vehicle_inspection/DB%20service/customer_login.dart';
import 'package:heavy_vehicle_inspection/DB%20service/login_db.dart';
import 'package:heavy_vehicle_inspection/components/bottomnavbar.dart';
//import 'package:heavy_vehicle_inspection/components/button_widget.dart';
import 'package:heavy_vehicle_inspection/components/logintype_button.dart';
import 'package:heavy_vehicle_inspection/components/text_field.dart';
import 'package:heavy_vehicle_inspection/constants/theme.dart';
import 'package:heavy_vehicle_inspection/technician%20repo/components/bottomnavbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  LogInData logindata = Get.put(LogInData());
  CutomerLogInData customerlogindata = Get.put(CutomerLogInData());

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController specialcontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();

  void updateSelectedUserType(String userType) {
    setState(() {
      selectedUserType = userType;
    });
  }

  String selectedUserType = '';
  void navigateToUserTypeScreen(String userType) {
    setState(() {
      selectedUserType = userType;
    });

    if (selectedUserType == 'Customer') {
      // Navigate to Customer screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNav(),
        ),
      );
    } else if (selectedUserType == 'Technician') {
      // Navigate to Technician screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AdminBottomNavBar(),
        ),
      );
    }
  }

  _storeOnboardInfo() async {
    // ignore: avoid_print
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    // ignore: avoid_print
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Hwhite,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Rental shop",
                    style: GoogleFonts.poppins(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: Hblue,
                    ),
                  ),
                  const Gap(30),
                  Text(
                    "Register your account",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Hblack,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    "Please select your user type",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Hblack.withOpacity(0.3),
                    ),
                  ),
                  const Gap(30),
                  SizedBox(
                    height: screenSize.height * 0.05,
                    child: Inputfield(
                      Controller: namecontroller,
                      labeltxt: 'Name',
                      tap: () {},
                      inputtype: TextInputType.name,
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    height: screenSize.height * 0.05,
                    child: Inputfield(
                      Controller: emailcontroller,
                      labeltxt: 'Email',
                      tap: () {},
                      inputtype: TextInputType.emailAddress,
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    height: screenSize.height * 0.05,
                    child: Inputfield(
                      Controller: phonecontroller,
                      labeltxt: 'Phone Number',
                      tap: () {},
                      inputtype: TextInputType.number,
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    height: screenSize.height * 0.05,
                    child: Inputfield(
                      Controller: specialcontroller,
                      labeltxt: 'specialist',
                      tap: () {},
                      inputtype: TextInputType.text,
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    height: screenSize.height * 0.05,
                    child: Inputfield(
                      Controller: locationcontroller,
                      labeltxt: 'Location',
                      tap: () {},
                      inputtype: TextInputType.streetAddress,
                    ),
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LogInTypeWidget(
                        screenSize: screenSize,
                        txt: "Customer",
                        imglink: 'https://www.svgrepo.com/show/491507/user.svg',
                        onTap: (userType) async {
                          navigateToUserTypeScreen(userType);

                          Map<String, dynamic> newcustomerlogin = {
                            'name': namecontroller.text,
                            'email': emailcontroller.text,
                            'phonenumber': phonecontroller.text,
                            'specialist': specialcontroller.text,
                            'location': locationcontroller.text,
                          };

                          int newcustomervarlogin = await customerlogindata
                              .insertcustomerlogindetail(newcustomerlogin);

                          HapticFeedback.lightImpact();

                          await _storeOnboardInfo();
                        },
                        selected: selectedUserType == 'Customer',
                      ),
                      LogInTypeWidget(
                        screenSize: screenSize,
                        txt: "Technician",
                        imglink:
                            'https://www.svgrepo.com/show/11268/technician-with-helmet.svg',
                        onTap: (userType) async {
                          navigateToUserTypeScreen(userType);

                          Map<String, dynamic> newtechnicianlogin = {
                            'name': namecontroller.text,
                            'email': emailcontroller.text,
                            'phonenumber': phonecontroller.text,
                            'specialist': specialcontroller.text,
                            'location': locationcontroller.text,
                          };

                          int newtechnicianvarlogin = await logindata
                              .insertlogindetail(newtechnicianlogin);

                          HapticFeedback.lightImpact();

                          await _storeOnboardInfo();
                        },
                        selected: selectedUserType == 'Technician',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
