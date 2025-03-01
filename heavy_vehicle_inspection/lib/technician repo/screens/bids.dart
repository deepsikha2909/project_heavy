// ignore_for_file: avoid_print, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heavy_vehicle_inspection/DB%20service/posting_db.dart';
import 'package:heavy_vehicle_inspection/components/button_widget.dart';
import 'package:heavy_vehicle_inspection/constants/theme.dart';
import 'package:heavy_vehicle_inspection/technician%20repo/screens/bookings.dart';

class BidsPage extends StatefulWidget {
  const BidsPage({super.key});

  @override
  State<BidsPage> createState() => _BidsPageState();
}

class _BidsPageState extends State<BidsPage> {
  PostingData postData = Get.put(PostingData());

  List<Map<String, dynamic>> postDataList = [];

  Future<void> allposts() async {
    final allpost = await postData.getallpostdetails();
    setState(() {
      postDataList = allpost;
    });
  }

  @override
  void initState() {
    super.initState();
    allposts();
  }

  Future<void> deletepost(int id) async {
    await postData.deletepostdetails(id);
    allposts();
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
          "Postings",
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
                            height: screenSize.height * 0.08,
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
                            postDataList[index]['technician'].toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Hblack,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.network(
                            'https://www.svgrepo.com/show/523225/calendar.svg',
                            color: Hblue,
                            height: 16,
                            width: 16,
                          ),
                          const Gap(10),
                          Text(
                            '${postDataList[index]['fromdate']} - ${postDataList[index]['todate']}',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Hblack.withOpacity(0.3),
                            ),
                          ),
                        ],
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
                            '${postDataList[index]['location'].toString()}, ${postDataList[index]['address'].toString()}, ${postDataList[index]['zipcode'].toString()}',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Hblack.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          ButtonWidget(
                            screenSize: screenSize,
                            txt: 'Book',
                            colors: Hblue,
                            click: () {
                              Get.to(
                                const AdminBookingPage(),
                              );
                            },
                            Height: screenSize.height * 0.05,
                            Width: screenSize.width * 0.3,
                      ),
                    ],
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
