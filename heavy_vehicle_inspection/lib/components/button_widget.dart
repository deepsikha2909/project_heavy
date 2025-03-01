import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heavy_vehicle_inspection/constants/theme.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.screenSize,
    required this.txt,
    required this.colors,
    required this.click,
    required this.Height,
    required this.Width,
  });

  final Size screenSize;
  final String txt;
  final Color colors;
  final VoidCallback click;
  final double Height;
  final double Width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: Height,
        width: Width,
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: Text(
          txt,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Hwhite,
          ),
        ),
      ),
    );
  }
}
