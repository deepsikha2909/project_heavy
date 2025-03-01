import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heavy_vehicle_inspection/constants/theme.dart';

class Inputfield extends StatelessWidget {
  const Inputfield({
    super.key,
    required this.Controller,
    required this.labeltxt,
    required this.tap,
    required this.inputtype,
    this.enabled,
  });

  final TextEditingController Controller;
  final String labeltxt;
  final VoidCallback tap;
  final TextInputType inputtype;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Hgrey.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        enabled: enabled,
        onTap: tap,
        keyboardType: inputtype,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Hblack.withOpacity(0.5),
        ),
        cursorColor: Hblack,
        controller: Controller,
        decoration: InputDecoration(
          isDense: true,
          labelText: labeltxt,
          labelStyle: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Hblack.withOpacity(0.4),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Hblack.withOpacity(0.1),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Hblack,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
