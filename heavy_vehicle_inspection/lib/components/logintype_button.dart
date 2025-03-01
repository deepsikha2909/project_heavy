import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heavy_vehicle_inspection/constants/theme.dart';

class LogInTypeWidget extends StatelessWidget {
  const LogInTypeWidget({
    super.key,
    required this.screenSize,
    required this.txt,
    required this.imglink,
    required this.onTap,
    required this.selected,
  });

  final Size screenSize;
  final String txt;
  final String imglink;

  final void Function(String) onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(txt);
      },
      child: Container(
        height: screenSize.height * 0.07,
        width: screenSize.width * 0.35,
        decoration: BoxDecoration(
          color: selected ? Hblue : Hblue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.network(
              imglink,
              color: selected ? Hwhite : Hblue,
              height: 28,
              width: 28,
            ),
            const Gap(10),
            Text(
              txt,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: selected ? Hwhite : Hblue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
