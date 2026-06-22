import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/app_data.dart';
import '../constants/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/section_title.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  bool _animate = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('skills-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_animate) {
          setState(() => _animate = true);
        }
      },
      child: Container(
        width: double.infinity,
        padding: Responsive.pagePadding(context),
        color: AppColors.background,
        child: _animate ? _buildContent(context) : const SizedBox(height: 600),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      children: [
        const SectionTitle(title: 'Skills', subtitle: 'What I work with'),
        const SizedBox(height: 60),

        // Tech category chips
        FadeInUp(
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: _techChips(),
          ),
        ),
        const SizedBox(height: 60),

        // Skill bars
        isMobile
            ? _buildSkillBars()
            : Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildSkillBars(
                skills: AppData.skills.take(5).toList(),
              ),
            ),
            const SizedBox(width: 60),
            Expanded(
              child: _buildSkillBars(
                skills: AppData.skills.skip(5).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _techChips() {
    final techs = [
      {'label': 'Flutter',    'icon': FontAwesomeIcons.mobile},
      {'label': 'Android',    'icon': FontAwesomeIcons.android},
      {'label': 'Dart',       'icon': FontAwesomeIcons.code},
      {'label': 'Kotlin',     'icon': FontAwesomeIcons.code},
      {'label': 'Firebase',   'icon': FontAwesomeIcons.fire},
      {'label': 'State Management',       'icon': FontAwesomeIcons.layerGroup},
      {'label': 'MVVM / Clean Architecture',   'icon': FontAwesomeIcons.layerGroup},
      {'label': 'REST / GraphQL', 'icon': FontAwesomeIcons.cloud},
      {'label': 'Git / CI-CD','icon': FontAwesomeIcons.codeMerge},
      {'label': 'Figma',      'icon': FontAwesomeIcons.figma},
    ];

    return techs.map((t) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.primary.withOpacity(0.25)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              t['icon'] as FaIconData,
              size: 14,
              color: AppColors.primary,
            ),
            const SizedBox(width: 8),
            Text(
              t['label'] as String,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  Widget _buildSkillBars({List<Map<String, dynamic>>? skills}) {
    final list = skills ?? AppData.skills;
    return Column(
      children: list.asMap().entries.map((entry) {
        return FadeInUp(
          delay: Duration(milliseconds: entry.key * 100),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _SkillBar(
              name:  entry.value['name'] as String,
              level: entry.value['level'] as double,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _SkillBar extends StatefulWidget {
  final String name;
  final double level;

  const _SkillBar({required this.name, required this.level});

  @override
  State<_SkillBar> createState() => _SkillBarState();
}

class _SkillBarState extends State<_SkillBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _anim = Tween<double>(begin: 0, end: widget.level).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic),
    );
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.name,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
            AnimatedBuilder(
              animation: _anim,
              builder: (_, __) => Text(
                '${(_anim.value * 100).round()}%',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: AnimatedBuilder(
            animation: _anim,
            builder: (_, __) => LinearProgressIndicator(
              value: _anim.value,
              backgroundColor: Colors.white12,
              valueColor:
              AlwaysStoppedAnimation<Color>(AppColors.primary),
              minHeight: 6,
            ),
          ),
        ),
      ],
    );
  }
}