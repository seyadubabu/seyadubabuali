import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/app_data.dart';
import '../constants/app_colors.dart';
import '../utils/responsive.dart';
import '../utils/url_helper.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      padding: Responsive.pagePadding(context),
      color: AppColors.background,
      child: Responsive.isDesktop(context) || Responsive.isTablet(context)
          ? _buildDesktop(context)
          : _buildMobile(context),
    );
  }

  // ── Desktop / Tablet: text left, photo right ──────────
  Widget _buildDesktop(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 55, child: _buildText(context)),
        const SizedBox(width: 60),
        Expanded(flex: 45, child: _buildPhoto()),
      ],
    );
  }

  // ── Mobile: stacked ───────────────────────────────────
  Widget _buildMobile(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        _buildPhoto(),
        const SizedBox(height: 40),
        _buildText(context),
      ],
    );
  }

  Widget _buildText(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Greeting
        FadeInDown(
          duration: const Duration(milliseconds: 600),
          child: Text(
            'Hello, I\'m',
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: AppColors.accent,
              fontWeight: FontWeight.w500,
              letterSpacing: 2,
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Name
        FadeInDown(
          delay: const Duration(milliseconds: 200),
          duration: const Duration(milliseconds: 600),
          child: Text(
            AppData.name,
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: GoogleFonts.poppins(
              fontSize: Responsive.fontSize(
                context,
                mobile: 36, tablet: 52, desktop: 64,
              ),
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              height: 1.1,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Title
        FadeInDown(
          delay: const Duration(milliseconds: 400),
          duration: const Duration(milliseconds: 600),
          child: Text(
            AppData.title,
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: GoogleFonts.poppins(
              fontSize: Responsive.fontSize(
                context,
                mobile: 16, tablet: 20, desktop: 24,
              ),
              fontWeight: FontWeight.w300,
              color: AppColors.primary,
            ),
          ),
        ),
        const SizedBox(height: 8),

        // Years badge
        FadeInDown(
          delay: const Duration(milliseconds: 500),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.accent.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              AppData.subtitle,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: AppColors.accent,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Bio
        FadeInUp(
          delay: const Duration(milliseconds: 600),
          child: Text(
            AppData.bio,
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: GoogleFonts.inter(
              fontSize: Responsive.fontSize(
                context,
                mobile: 14, tablet: 15, desktop: 16,
              ),
              color: AppColors.textSecondary,
              height: 1.8,
            ),
          ),
        ),
        const SizedBox(height: 40),

        // Buttons
        FadeInUp(
          delay: const Duration(milliseconds: 800),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
            children: [
              // Primary CTA
              ElevatedButton.icon(
                onPressed: () => UrlHelper.openResume(),
                icon: const Icon(Icons.download_rounded, size: 18),
                label: Text(
                  'Download Resume',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28, vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              // Secondary CTA
              OutlinedButton.icon(
                onPressed: () => UrlHelper.openUrl(AppData.github),
                icon: const FaIcon(FontAwesomeIcons.github, size: 16),
                label: Text(
                  'View GitHub',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white24),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28, vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),

        // Social icons
        FadeInUp(
          delay: const Duration(milliseconds: 1000),
          child: Row(
            mainAxisAlignment: isMobile
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              _SocialIcon(
                icon: FontAwesomeIcons.linkedin,
                color: const Color(0xFF0077B5),
                url: AppData.linkedIn,
              ),
              const SizedBox(width: 16),
              _SocialIcon(
                icon: FontAwesomeIcons.github,
                color: Colors.white,
                url: AppData.github,
              ),
              const SizedBox(width: 16),
              _SocialIcon(
                icon: FontAwesomeIcons.envelope,
                color: AppColors.accent,
                url: 'mailto:${AppData.email}',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPhoto() {
    return Center(
      child: ZoomIn(
        delay: const Duration(milliseconds: 400),
        child: Container(
          width: 320,
          height: 320,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primary.withOpacity(0.5),
              width: 4,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.2),
                blurRadius: 40,
                spreadRadius: 10,
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              AppData.profileImage,
              fit: BoxFit.cover,
              // Fallback if image not added yet
              errorBuilder: (_, __, ___) => Container(
                color: AppColors.surface,
                child: const Icon(
                  Icons.person,
                  size: 120,
                  color: Colors.white24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final FaIconData icon;
  final Color color;
  final String url;

  const _SocialIcon({
    required this.icon,
    required this.color,
    required this.url,
  });

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => UrlHelper.openUrl(widget.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(
              color: _hovered ? widget.color : Colors.white12,
            ),
            borderRadius: BorderRadius.circular(8),
            color: _hovered
                ? widget.color.withOpacity(0.1)
                : Colors.transparent,
          ),
          child: FaIcon(widget.icon, color: widget.color, size: 20),
        ),
      ),
    );
  }
}