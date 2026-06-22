import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Hero section
  static TextStyle heroName = GoogleFonts.poppins(
    fontSize: 64,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    letterSpacing: -1.5,
  );

  static TextStyle heroTitle = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w300,
    color: Color(0xFF00D9FF),
  );

  // Section headings
  static TextStyle sectionHeading = GoogleFonts.poppins(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // Body text
  static TextStyle bodyText = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0xFFB0B0B0),
    height: 1.8,
  );

  // Skill labels, card text
  static TextStyle labelText = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  // Navbar links
  static TextStyle navLink = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.white70,
  );

  // Buttons
  static TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.5,
  );
}