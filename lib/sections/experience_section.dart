import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../constants/app_data.dart';
import '../constants/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/section_title.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  bool _animate = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('experience-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_animate) {
          setState(() => _animate = true);
        }
      },
      child: Container(
        width: double.infinity,
        padding: Responsive.pagePadding(context),
        color: AppColors.surface,
        child: _animate
            ? _buildContent(context)
            : const SizedBox(height: 600),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(
          title: 'Experience',
          subtitle: 'My career journey',
        ),
        const SizedBox(height: 60),

        // Desktop: centered timeline with max width
        // Mobile: full width single column
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Responsive.isDesktop(context) ? 860 : double.infinity,
            ),
            child: _buildTimeline(context),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeline(BuildContext context) {
    final experiences = AppData.experience;

    return Column(
      children: experiences.asMap().entries.map((entry) {
        final index  = entry.key;
        final exp    = entry.value;
        final isLast = index == experiences.length - 1;

        return FadeInUp(
          delay: Duration(milliseconds: index * 200),
          duration: const Duration(milliseconds: 600),
          child: _TimelineItem(
            experience: exp,
            index:      index,
            isLast:     isLast,
          ),
        );
      }).toList(),
    );
  }
}

// ── Single timeline item ──────────────────────────────────
class _TimelineItem extends StatefulWidget {
  final Map<String, dynamic> experience;
  final int  index;
  final bool isLast;

  const _TimelineItem({
    required this.experience,
    required this.index,
    required this.isLast,
  });

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem> {
  bool _expanded = true;   // first item open by default
  bool _hovered  = false;

  @override
  void initState() {
    super.initState();
    // Only first item expanded by default
    _expanded = widget.index == 0;
  }

  @override
  Widget build(BuildContext context) {
    final exp     = widget.experience;
    final isMobile = Responsive.isMobile(context);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Left: timeline spine ────────────────────────
          SizedBox(
            width: isMobile ? 40 : 60,
            child: Column(
              children: [
                // Dot
                Container(
                  width:  isMobile ? 14 : 18,
                  height: isMobile ? 14 : 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _hovered || widget.index == 0
                        ? AppColors.primary
                        : Colors.white24,
                    border: Border.all(
                      color: AppColors.primary,
                      width: 2,
                    ),
                    boxShadow: (_hovered || widget.index == 0)
                        ? [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.4),
                        blurRadius: 10,
                        spreadRadius: 2,
                      )
                    ]
                        : [],
                  ),
                ),

                // Vertical line — hidden for last item
                if (!widget.isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end:   Alignment.bottomCenter,
                          colors: [
                            AppColors.primary.withOpacity(0.6),
                            AppColors.primary.withOpacity(0.1),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // ── Right: experience card ───────────────────────
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: widget.isLast ? 0 : 32,
                left:   isMobile ? 12 : 20,
              ),
              child: MouseRegion(
                onEnter: (_) => setState(() => _hovered = true),
                onExit:  (_) => setState(() => _hovered = false),
                child: GestureDetector(
                  onTap: () => setState(() => _expanded = !_expanded),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: _hovered
                          ? AppColors.primary.withOpacity(0.05)
                          : AppColors.background,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: _hovered
                            ? AppColors.primary.withOpacity(0.4)
                            : Colors.white12,
                      ),
                      boxShadow: _hovered
                          ? [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.08),
                          blurRadius: 20,
                          spreadRadius: 2,
                        )
                      ]
                          : [],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── Header row ───────────────────
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Company icon
                            Container(
                              width:  44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColors.primary.withOpacity(0.2),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  // First letter of company name
                                  (exp['company'] as String)[0].toUpperCase(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),

                            // Role + company
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    exp['role'] as String,
                                    style: GoogleFonts.poppins(
                                      fontSize: isMobile ? 15 : 17,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    exp['company'] as String,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Period badge + expand icon
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color:
                                      AppColors.primary.withOpacity(0.2),
                                    ),
                                  ),
                                  child: Text(
                                    exp['period'] as String,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                AnimatedRotation(
                                  turns: _expanded ? 0.5 : 0,
                                  duration:
                                  const Duration(milliseconds: 300),
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: AppColors.primary,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // ── Expandable bullets ────────────
                        AnimatedCrossFade(
                          firstChild: const SizedBox(width: double.infinity),
                          secondChild: _buildBullets(
                            exp['bullets'] as List<String>,
                            isMobile,
                          ),
                          crossFadeState: _expanded
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: const Duration(milliseconds: 300),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBullets(List<String> bullets, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Divider(color: Colors.white12),
        const SizedBox(height: 16),
        ...bullets.map(
              (bullet) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bullet dot
                Container(
                  margin: const EdgeInsets.only(top: 7),
                  width:  6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColors.accent,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),

                // Bullet text
                Expanded(
                  child: Text(
                    bullet,
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 13 : 14,
                      color: AppColors.textSecondary,
                      height: 1.7,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}