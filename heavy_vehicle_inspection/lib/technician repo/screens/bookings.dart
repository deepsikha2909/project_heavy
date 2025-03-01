// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heavy_vehicle_inspection/DB%20service/techpostdata.dart';
import 'package:heavy_vehicle_inspection/components/text_field.dart';
import 'package:heavy_vehicle_inspection/constants/theme.dart';

class AdminBookingPage extends StatefulWidget {
  const AdminBookingPage({
    super.key,
  });

  @override
  State<AdminBookingPage> createState() => _AdminBookingPageState();
}

class _AdminBookingPageState extends State<AdminBookingPage> {
  TechPostingData techPostingData = Get.put(TechPostingData());

  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController experineceController = TextEditingController();
  TextEditingController specialistController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController queryController = TextEditingController();
  TextEditingController jobnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Hwhite,
      appBar: AppBar(
        backgroundColor: Hwhite,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            navigator!.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Hblack,
            size: 24,
          ),
        ),
        title: Text(
          "Apply Job",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Hblack,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Job Application",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Hblack,
                ),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.network(
                    'https://www.svgrepo.com/show/27089/construction-vehicle-for-concrete-transportation.svg',
                    color: Hblue,
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.05,
                    width: screenSize.width * 0.7,
                    child: Inputfield(
                      Controller: jobnameController,
                      labeltxt: 'Job Name',
                      tap: () {},
                      inputtype: TextInputType.text,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                "Technician Contact",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Hblack,
                ),
              ),
              const Gap(10),
              SizedBox(
                height: screenSize.height * 0.05,
                child: Inputfield(
                  Controller: nameController,
                  labeltxt: 'Person name',
                  tap: () {},
                  inputtype: TextInputType.name,
                ),
              ),
              const Gap(10),
              SizedBox(
                height: screenSize.height * 0.05,
                child: Inputfield(
                  Controller: contactController,
                  labeltxt: 'Contact Number',
                  tap: () {},
                  inputtype: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                "Skills & Experience",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Hblack,
                ),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: screenSize.height * 0.05,
                    width: screenSize.width * 0.44,
                    child: Inputfield(
                      Controller: skillsController,
                      labeltxt: 'Skills',
                      inputtype: TextInputType.text,
                      tap: () {},
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.05,
                    width: screenSize.width * 0.44,
                    child: Inputfield(
                      Controller: experineceController,
                      labeltxt: 'Experience',
                      inputtype: TextInputType.number,
                      tap: () {},
                    ),
                  ),
                ],
              ),
              const Gap(10),
              SizedBox(
                height: screenSize.height * 0.05,
                child: Inputfield(
                  Controller: specialistController,
                  labeltxt: 'Specialist',
                  tap: () {},
                  inputtype: TextInputType.text,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                "Technician Location",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Hblack,
                ),
              ),
              const Gap(10),
              SizedBox(
                height: screenSize.height * 0.05,
                child: Inputfield(
                  Controller: addressController,
                  labeltxt: 'Address',
                  inputtype: TextInputType.streetAddress,
                  tap: () {},
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: screenSize.height * 0.05,
                child: Inputfield(
                  Controller: queryController,
                  labeltxt: 'Queries',
                  inputtype: TextInputType.text,
                  tap: () {},
                ),
              ),
              const Gap(40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Material(
        color: Hblue,
        child: TextButton(
          onPressed: () async {
            Map<String, dynamic> newrow = {
              'name': nameController.text,
              'contact': contactController.text,
              'skills': skillsController.text,
              'experience': experineceController.text,
              'specialist': specialistController.text,
              'address': addressController.text,
              'queries': queryController.text,
              'jobname': jobnameController.text,
            };

            // ignore: unused_local_variable
            await techPostingData.insertpostdetail(newrow);
            navigator!.pop(context);
          },
          child: Text(
            "Post Details",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Hwhite,
            ),
          ),
        ),
      ),
    );
  }
}
