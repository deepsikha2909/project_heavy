import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heavy_vehicle_inspection/components/bottomnavbar.dart';
import 'package:heavy_vehicle_inspection/components/logintype_button.dart';
import 'package:heavy_vehicle_inspection/constants/theme.dart';
import 'package:heavy_vehicle_inspection/technician%20repo/components/bottomnavbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
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
      body: Center(
        child: SafeArea(
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
              const Gap(10),
              Text(
                "Choose the type Login",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Hblack,
                ),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LogInTypeWidget(
                    screenSize: screenSize,
                    txt: "Customer",
                    imglink: 'https://www.svgrepo.com/show/491507/user.svg',
                    onTap: (userType) async {
                      navigateToUserTypeScreen(userType);

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
    );
  }
}
