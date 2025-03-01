// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heavy_vehicle_inspection/constants/theme.dart';
import 'package:heavy_vehicle_inspection/technician%20repo/screens/account.dart';
import 'package:heavy_vehicle_inspection/technician%20repo/screens/bids.dart';
//import 'package:heavy_vehicle_inspection/technician%20repo/screens/bookings.dart';
import 'package:heavy_vehicle_inspection/technician%20repo/screens/homepage.dart';

class AdminBottomNavBar extends StatefulWidget {
  const AdminBottomNavBar({super.key});

  @override
  State<AdminBottomNavBar> createState() => _AdminBottomNavBarState();
}

class _AdminBottomNavBarState extends State<AdminBottomNavBar> {
  int currentIndex = 0;

  final screens = [
    const AdminHomePage(),
    const BidsPage(),
    //const AdminBookingPage(),
    const AdminAccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Hwhite,
        type: BottomNavigationBarType.fixed,
        elevation: 50,
        iconSize: 16,
        currentIndex: currentIndex,
        selectedLabelStyle: const TextStyle(
          color: Hblue,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Hblack.withOpacity(0.3),
        selectedItemColor: Hblue,
        unselectedLabelStyle: GoogleFonts.poppins(
          color: Hblack.withOpacity(0.3),
          fontSize: 10,
        ),
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.network(
              'https://www.svgrepo.com/show/524552/file-text.svg',
              color: Hblack.withOpacity(0.3),
              height: 22,
              width: 22,
            ),
            activeIcon: SvgPicture.network(
              'https://www.svgrepo.com/show/524552/file-text.svg',
              color: Hblue,
              height: 22,
              width: 22,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.network(
              'https://www.svgrepo.com/show/509892/dollar-symbol.svg',
              color: Hblack.withOpacity(0.3),
              height: 22,
              width: 22,
            ),
            activeIcon: SvgPicture.network(
              'https://www.svgrepo.com/show/509892/dollar-symbol.svg',
              color: Hblue,
              height: 22,
              width: 22,
            ),
            label: 'Bids',
          ),
          // BottomNavigationBarItem(
          //   icon: SvgPicture.network(
          //     'https://www.svgrepo.com/show/523225/calendar.svg',
          //     color: Hblack.withOpacity(0.3),
          //     height: 22,
          //     width: 22,
          //   ),
          //   activeIcon: SvgPicture.network(
          //     'https://www.svgrepo.com/show/523225/calendar.svg',
          //     color: Hblue,
          //     height: 22,
          //     width: 22,
          //   ),
          //   label: 'Bookings',
          // ),
          BottomNavigationBarItem(
            icon: SvgPicture.network(
              'https://www.svgrepo.com/show/524954/settings.svg',
              color: Hblack.withOpacity(0.3),
              height: 22,
              width: 22,
            ),
            activeIcon: SvgPicture.network(
              'https://www.svgrepo.com/show/524954/settings.svg',
              color: Hblue,
              height: 22,
              width: 22,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
