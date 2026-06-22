import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../sections/hero_section.dart';
import '../sections/about_section.dart';
import '../sections/skills_section.dart';
import '../sections/experience_section.dart';
import '../sections/projects_section.dart';
import '../sections/contact_section.dart';
import '../widgets/navbar.dart';
import '../utils/responsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ItemScrollController _scrollController = ItemScrollController();
  final ItemPositionsListener _positionsListener =
  ItemPositionsListener.create();

  // All portfolio sections in order
  final List<Widget> _sections = const [
    HeroSection(),
    AboutSection(),
    SkillsSection(),
    ExperienceSection(),
    ProjectsSection(),
    ContactSection(),
  ];

  void scrollToSection(int index) {
    _scrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      // Mobile: show hamburger drawer
      drawer: Responsive.isMobile(context)
          ? NavDrawer(onNavTap: scrollToSection)
          : null,
      // Desktop/Tablet: top navbar
      appBar: Responsive.isMobile(context)
          ? AppBar(
        backgroundColor: const Color(0xFF0D0D0D),
        elevation: 0,
        title: const Text(
          'YN', // your initials
          style: TextStyle(
            color: Color(0xFF6C63FF),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      )
          : null,
      body: Column(
        children: [
          // Desktop/Tablet navbar sits above scroll content
          if (!Responsive.isMobile(context))
            Navbar(onNavTap: scrollToSection),

          // Scrollable sections
          Expanded(
            child: ScrollablePositionedList.builder(
              itemScrollController: _scrollController,
              itemPositionsListener: _positionsListener,
              itemCount: _sections.length,
              itemBuilder: (context, index) => _sections[index],
            ),
          ),
        ],
      ),
    );
  }
}