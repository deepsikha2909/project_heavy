// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heavy_vehicle_inspection/DB%20service/posting_db.dart';
import 'package:heavy_vehicle_inspection/components/text_field.dart';
import 'package:heavy_vehicle_inspection/constants/theme.dart';
import 'package:intl/intl.dart';

class PostDataDScreen extends StatefulWidget {
  final String? vehicle;
  const PostDataDScreen({this.vehicle,super.key});
  @override
  State<PostDataDScreen> createState() => _PostDataDScreenState();
}

class _PostDataDScreenState extends State<PostDataDScreen> {
  PostingData postData = Get.put(PostingData());

  // PostingPage postingpage = Get.put(PostingPage());

  // List<Map<String, dynamic>> postDataList = [];

  // Future<void> _allposts() async {
  //   final allpost = await postData.getallpostdetails();
  //   setState(() {
  //     postDataList = allpost;
  //   });
  // }

  TextEditingController controllername = TextEditingController();
  TextEditingController controllerfromdate = TextEditingController();
  TextEditingController controllertodate = TextEditingController();
  TextEditingController controllerlocation = TextEditingController();
  TextEditingController controllerzipcode = TextEditingController();
  TextEditingController controlleraddress = TextEditingController();
  TextEditingController controllerquestion = TextEditingController();
  TextEditingController controllertechnician = TextEditingController();

  DateTime? selectedFromDate;
  DateTime? selectedToDate;
  @override
  void initState() {
    super.initState();
    controllertechnician = TextEditingController(text: widget.vehicle);
  }

  Future<void> _selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedFromDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedFromDate) {
      setState(() {
        selectedFromDate = picked;
        controllerfromdate.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedToDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedToDate) {
      setState(() {
        selectedToDate = picked;
        controllertodate.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
          "Create New Post",
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
                "Vehicle Description",
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
                      enabled:false,
                      Controller: controllertechnician,
                      labeltxt: 'Vehicle',
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
                "Appointer Name",
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
                  Controller: controllername,
                  labeltxt: 'Person name',
                  tap: () {},
                  inputtype: TextInputType.name,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                "Prefered Date Range",
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
                  GestureDetector(
                    onTap: () => _selectFromDate(context),
                    child: AbsorbPointer(
                      child: SizedBox(
                        height: screenSize.height * 0.05,
                        width: screenSize.width * 0.44,
                        child: Inputfield(
                          Controller: controllerfromdate,
                          labeltxt: 'From Date',
                          inputtype: TextInputType.datetime,
                          tap: () {},
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _selectToDate(context),
                    child: AbsorbPointer(
                      child: SizedBox(
                        height: screenSize.height * 0.05,
                        width: screenSize.width * 0.44,
                        child: Inputfield(
                          Controller: controllertodate,
                          labeltxt: 'To Date',
                          inputtype: TextInputType.datetime,
                          tap: () {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                "Equipment Location",
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
                  Controller: controllerlocation,
                  labeltxt: 'Location',
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
                  Controller: controllerzipcode,
                  labeltxt: 'Zipcode',
                  inputtype: TextInputType.number,
                  tap: () {},
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: screenSize.height * 0.05,
                child: Inputfield(
                  Controller: controlleraddress,
                  labeltxt: 'Address',
                  inputtype: TextInputType.streetAddress,
                  tap: () {},
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                "Specify Inspection Questions",
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
                  Controller: controllerquestion,
                  labeltxt: 'Questions',
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
              'name': controllername.text,
              'fromdate': controllerfromdate.text,
              'todate': controllertodate.text,
              'location': controllerlocation.text,
              'zipcode': controllerzipcode.text,
              'address': controlleraddress.text,
              'questions': controllerquestion.text,
              'technician': controllertechnician.text,
            };

            // ignore: unused_local_variable
            int newpersonid = await postData.insertpostdetail(newrow);
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
