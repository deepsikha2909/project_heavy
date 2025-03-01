// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heavy_vehicle_inspection/DB%20service/techpostdata.dart';
import 'package:heavy_vehicle_inspection/components/button_widget.dart';
import 'package:heavy_vehicle_inspection/constants/theme.dart';
import 'package:heavy_vehicle_inspection/service/service.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  TechPostingData techPostingData = Get.put(TechPostingData());
  Service service = Get.put(Service());

  List<Map<String, dynamic>> postDataList = [];

  Future<void> allposts() async {
    final allpost = await techPostingData.getallpostdetails();
    setState(() {
      postDataList = allpost;
    });
  }

  @override
  void initState() {
    super.initState();
    allposts();
  }
  final Uri googleMapsUrl = Uri.parse(
    "https://www.google.com/maps/dir//Erode,+Tamil+Nadu/@11.3466233,77.6741971,13z/data=!4m8!4m7!1m0!1m5!1m1!1s0x3ba96f46762f4671:0xd97da6e3d9c7f75e!2m2!1d77.7171642!2d11.3410364?entry=ttu&g_ep=EgoyMDI0MTIwOC4wIKXMDSoASAFQAw%3D%3D",
  );

  Future<void> launchURL() async {
    if (!await launchUrl(
      googleMapsUrl,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch');
}
}

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Hwhite,
      appBar: AppBar(
        backgroundColor: Hwhite,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Bookings",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Hblack,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: postDataList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                height: screenSize.height * 0.25,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: screenSize.height * 0.02,
                            width: screenSize.width * 0.15,
                            decoration: BoxDecoration(
                              color: Hgrey,
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  'https://img.freepik.com/premium-vector/heavy-truck-illustration-with-solid-color_232942-38.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Gap(10),
                          Text(
                            postDataList[index]['name'].toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Hblack,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        postDataList[index]['jobname'],
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Hblack.withOpacity(0.3),
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.network(
                            'https://www.svgrepo.com/show/532540/location-pin-alt-1.svg',
                            color: Hblue,
                            height: 16,
                            width: 16,
                          ),
                          const Gap(10),
                          Text(
                            postDataList[index]['experience'].toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Hblack.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      ButtonWidget(
                        screenSize: screenSize,
                        txt: 'Contact',
                        colors: Hblue,
                        click: () async {
                          await service.makePhonecall(
                            '+91${postDataList[index]['contact'].toString()}',
                          );
                        },
                        Height: screenSize.height * 0.05,
                        Width: screenSize.width * 0.3,
                      ),
                      const Gap(10),
                      ButtonWidget(
                        screenSize: screenSize,
                        txt: 'Location',
                        colors: Hblue,
                        click: () {
                          launchURL();
        
                        },
                        Height: screenSize.height * 0.05,
                        Width: screenSize.width * 0.3,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
