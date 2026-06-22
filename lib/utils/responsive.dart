import 'package:flutter/material.dart';

class Responsive {
  // ── Breakpoints ──────────────────────────────────────
  static const double mobileBreakpoint  = 600;
  static const double tabletBreakpoint  = 1024;

  // ── Type checks ──────────────────────────────────────
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
          MediaQuery.of(context).size.width < tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  // ── Screen dimensions ────────────────────────────────
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // ── Responsive value helper ───────────────────────────
  // Returns different values for each screen size
  // Usage: Responsive.value(context, mobile: 16, tablet: 20, desktop: 24)
  static T value<T>(
      BuildContext context, {
        required T mobile,
        T? tablet,
        required T desktop,
      }) {
    if (isDesktop(context)) return desktop;
    if (isTablet(context)) return tablet ?? desktop;
    return mobile;
  }

  // ── Responsive font sizes ─────────────────────────────
  static double fontSize(
      BuildContext context, {
        required double mobile,
        double? tablet,
        required double desktop,
      }) {
    return value<double>(
      context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }

  // ── Responsive padding ────────────────────────────────
  static EdgeInsets pagePadding(BuildContext context) {
    return value(
      context,
      mobile:  const EdgeInsets.symmetric(horizontal: 24,  vertical: 40),
      tablet:  const EdgeInsets.symmetric(horizontal: 60,  vertical: 60),
      desktop: const EdgeInsets.symmetric(horizontal: 120, vertical: 80),
    );
  }

  // ── Content max width ─────────────────────────────────
  // Stops content stretching too wide on large monitors
  static double contentMaxWidth(BuildContext context) {
    return value(
      context,
      mobile:  double.infinity,
      tablet:  760,
      desktop: 1200,
    );
  }
}