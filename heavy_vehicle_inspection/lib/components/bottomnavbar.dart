// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heavy_vehicle_inspection/constants/theme.dart';
import 'package:heavy_vehicle_inspection/screens/account.dart';
import 'package:heavy_vehicle_inspection/screens/booking.dart';
import 'package:heavy_vehicle_inspection/screens/homepage.dart';
import 'package:heavy_vehicle_inspection/screens/posting.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  final screens = [
    const HomePage(),
    const PostingPage(),
    const BookingPage(),
    const AccountPage(),
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
              'https://www.svgrepo.com/show/524644/home-angle.svg',
              color: Hblack.withOpacity(0.3),
              height: 22,
              width: 22,
            ),
            activeIcon: SvgPicture.network(
              'https://www.svgrepo.com/show/524644/home-angle.svg',
              color: Hblue,
              height: 22,
              width: 22,
            ),
            label: 'Home',
          ),
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
            label: 'My Posting',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.network(
              'https://www.svgrepo.com/show/523225/calendar.svg',
              color: Hblack.withOpacity(0.3),
              height: 22,
              width: 22,
            ),
            activeIcon: SvgPicture.network(
              'https://www.svgrepo.com/show/523225/calendar.svg',
              color: Hblue,
              height: 22,
              width: 22,
            ),
            label: 'Bookings',
          ),
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
