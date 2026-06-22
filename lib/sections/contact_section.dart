import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../constants/app_data.dart';
import '../constants/app_colors.dart';
import '../utils/responsive.dart';
import '../utils/url_helper.dart';
import '../widgets/section_title.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  bool _animate = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('contact-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_animate) {
          setState(() => _animate = true);
        }
      },
      child: Container(
        width: double.infinity,
        padding: Responsive.pagePadding(context),
        color: AppColors.background,
        child: _animate ? _buildContent(context) : const SizedBox(height: 500),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(
          title: 'Contact',
          subtitle: 'Let\'s work together',
        ),
        const SizedBox(height: 20),

        FadeInUp(
          child: Text(
            'I\'m open to senior Flutter/Android roles, freelance projects,\n'
                'and technical consulting. Let\'s connect.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: AppColors.textSecondary,
              height: 1.8,
            ),
          ),
        ),
        const SizedBox(height: 60),

        // Contact cards
        FadeInUp(
          delay: const Duration(milliseconds: 200),
          child: Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _ContactCard(
                icon: FontAwesomeIcons.envelope,
                label: 'Email',
                value: AppData.email,
                color: AppColors.accent,
                onTap: () => UrlHelper.openEmail(AppData.email),
              ),
              _ContactCard(
                icon: FontAwesomeIcons.linkedin,
                label: 'LinkedIn',
                value: 'linkedin.com/in/yourprofile',
                color: const Color(0xFF0077B5),
                onTap: () => UrlHelper.openUrl(AppData.linkedIn),
              ),
              _ContactCard(
                icon: FontAwesomeIcons.github,
                label: 'GitHub',
                value: 'github.com/yourusername',
                color: Colors.white,
                onTap: () => UrlHelper.openUrl(AppData.github),
              ),
            ],
          ),
        ),
        const SizedBox(height: 80),

        // Footer
        FadeInUp(
          delay: const Duration(milliseconds: 400),
          child: Column(
            children: [
              const Divider(color: Colors.white12),
              const SizedBox(height: 24),
              Text(
                'Built with Flutter Web · ${AppData.name} © 2025',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Made with ', style: TextStyle(color: Colors.white38)),
                  const Icon(Icons.favorite, color: Colors.red, size: 14),
                  Text(
                    ' using Flutter',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContactCard extends StatefulWidget {
  final FaIconData icon;
  final String label;
  final String value;
  final Color color;
  final VoidCallback onTap;

  const _ContactCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    required this.onTap,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 240,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: _hovered
                ? widget.color.withOpacity(0.08)
                : AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _hovered ? widget.color : Colors.white12,
            ),
          ),
          child: Column(
            children: [
              FaIcon(widget.icon, color: widget.color, size: 32),
              const SizedBox(height: 16),
              Text(
                widget.label,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.value,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}