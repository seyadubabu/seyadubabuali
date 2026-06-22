import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../constants/app_data.dart';
import '../constants/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/section_title.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  bool _animate = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('about-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_animate) {
          setState(() => _animate = true);
        }
      },
      child: Container(
        width: double.infinity,
        padding: Responsive.pagePadding(context),
        color: AppColors.surface,
        child: _animate ? _buildContent(context) : const SizedBox(height: 500),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      children: [
        const SectionTitle(title: 'About Me', subtitle: 'Who I am'),
        const SizedBox(height: 60),

        isMobile
            ? _buildMobileLayout(context)
            : _buildDesktopLayout(context),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 45, child: _buildStats()),
        const SizedBox(width: 80),
        Expanded(flex: 55, child: _buildBio()),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildBio(),
        const SizedBox(height: 40),
        _buildStats(),
      ],
    );
  }

  Widget _buildBio() {
    return FadeInLeft(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppData.bio,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: AppColors.textSecondary,
              height: 1.9,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'I specialize in building Flutter and Android applications '
                'that serve millions of users. My focus is always on clean '
                'architecture, performance, and developer experience — '
                'writing code that scales and teams enjoy working with.',
            style: GoogleFonts.inter(
              fontSize: 16,
              color: AppColors.textSecondary,
              height: 1.9,
            ),
          ),
          const SizedBox(height: 32),

          // Key info rows
          _InfoRow(icon: Icons.location_on_outlined, text: 'Tuticorin, Tamil Nadu, India'),
          const SizedBox(height: 12),
          _InfoRow(icon: Icons.work_outline, text: 'Open to on-site/hybrid/remote opportunities'),
          const SizedBox(height: 12),
          _InfoRow(icon: Icons.school_outlined, text: 'B.E. Computer Science'),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return FadeInRight(
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: [
          _StatCard(value: '9.6+',   label: 'Years Experience'),
          _StatCard(value: '4+',  label: 'Apps Delivered'),
          _StatCard(value: '10M+', label: 'Users Reached'),
          _StatCard(value: '95%',  label: 'Crash-Free Rate'),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary, size: 18),
        const SizedBox(width: 12),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 15,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}