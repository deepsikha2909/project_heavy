// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heavy_vehicle_inspection/DB%20service/customer_login.dart';
import 'package:heavy_vehicle_inspection/Inner%20screens/post_inner_screen.dart';
import 'package:heavy_vehicle_inspection/components/topic_divider.dart';
import 'package:heavy_vehicle_inspection/constants/machine_images.dart';
import 'package:heavy_vehicle_inspection/constants/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MachineImages machineimages = Get.put(MachineImages());
  CutomerLogInData customerdata = Get.put(CutomerLogInData());

  List<Map<String, dynamic>> postcustomerDataList = [];

  Future<void> allcustomerposts() async {
    final allcustomerpost = await customerdata.getallcustomerlogindetails();
    setState(() {
      postcustomerDataList = allcustomerpost;
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
        elevation: 0, automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Rental shop",
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Hblack,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  size: 16,
                  color: Hblack.withOpacity(0.3),
                ),
                const Gap(10),
                SizedBox(
                  height: 13,
                  width: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: postcustomerDataList.length,
                    itemBuilder: (context, index) {
                      return Text(
                        postcustomerDataList[0]['location'].toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Hblack.withOpacity(0.3),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        // actions: [
        //   // IconButton(
        //   //   onPressed: () {},
        //   //   icon: SvgPicture.network(
        //   //     'https://www.svgrepo.com/show/523993/bell.svg',
        //   //     color: Hblue,
        //   //   ),
        //   // ),
        // ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      /*floatingActionButton: FloatingActionButton(
        backgroundColor: Hblue,
        elevation: 0,
        onPressed: () => Get.to(
          const PostDataDScreen(),
        ),
        child: const Icon(
          Icons.add_rounded,
          color: Hwhite,
          size: 26,
        ),
      ),*/
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopicAndDivider(
                txt: 'Constructions',
              ),
              SizedBox(
                height: screenSize.height * 0.15,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: machineimages.constructionMachines.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.to(
         PostDataDScreen(
  vehicle: machineimages.constructionMachines[index]['vehicle'],
),
        ),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: screenSize.height * 0.1,
                                width: screenSize.width * 0.2,
                                decoration: BoxDecoration(
                                  color: Hwhite,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      machineimages.constructionMachines[index]
                                              ['image']
                                          .toString(),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Gap(10),
                              Text(
                                machineimages.constructionMachines[index]
                                        ['vehicle']
                                    .toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Hblack,
                                ),
                              ),
                            ],
                          ),
                          const Gap(25),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const TopicAndDivider(
                txt: 'Farm',
              ),
              SizedBox(
                height: screenSize.height * 0.15,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: machineimages.constructionMachines.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(onTap:() => Get.to(PostDataDScreen(vehicle: machineimages.farmMachines[index]['vehicle'],),),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: screenSize.height * 0.1,
                                width: screenSize.width * 0.2,
                                decoration: BoxDecoration(
                                  color: Hwhite,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      machineimages.farmMachines[index]['image']
                                          .toString(),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Gap(10),
                              Text(
                                machineimages.farmMachines[index]['vehicle']
                                    .toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Hblack,
                                ),
                              ),
                            ],
                          ),
                          const Gap(25),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const TopicAndDivider(
                txt: 'Trucks',
              ),
              SizedBox(
                height: screenSize.height * 0.15,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: machineimages.constructionMachines.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(onTap:() => Get.to(PostDataDScreen(vehicle: machineimages.farmMachines[index]['vehicle'],),),
                    child:Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: screenSize.height * 0.1,
                              width: screenSize.width * 0.2,
                              decoration: BoxDecoration(
                                color: Hwhite,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    machineimages.farmMachines[index]['image']
                                        .toString(),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Gap(10),
                            Text(
                              machineimages.farmMachines[index]['vehicle']
                                  .toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Hblack,
                              ),
                            ),
                          ],
                        ),
                        const Gap(25),
                      ],
                    ),
                    );
                  },
                ),
              ),
              const TopicAndDivider(
                txt: 'Trailers',
              ),
              SizedBox(
                height: screenSize.height * 0.15,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: machineimages.constructionMachines.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(onTap:() => Get.to(PostDataDScreen(vehicle: machineimages.farmMachines[index]['vehicle'],),),
                    child:Row(
                      children: [

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: screenSize.height * 0.1,
                              width: screenSize.width * 0.2,
                              decoration: BoxDecoration(
                                color: Hwhite,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    machineimages.farmMachines[index]['image']
                                        .toString(),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Gap(10),
                            Text(
                              machineimages.farmMachines[index]['vehicle']
                                  .toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Hblack,
                              ),
                            ),
                          ],
                        ),
                        const Gap(25),
                      ],
                     ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
