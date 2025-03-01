import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heavy_vehicle_inspection/constants/theme.dart';

class TopicAndDivider extends StatelessWidget {
  const TopicAndDivider({
    super.key,
    required this.txt,
  });

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(40),
        Text(
          txt,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Hblack,
          ),
        ),
        Divider(
          height: 0.1,
          thickness: 0.6,
          color: Hblack.withOpacity(0.1),
        ),
        const Gap(20),
      ],
    );
  }
}
