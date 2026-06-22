import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive.dart';

// Section labels matching your scroll indexes
const List<String> _navItems = [
  'Home', 'About', 'Skills', 'Experience', 'Projects', 'Contact'
];

// ── Desktop / Tablet top navbar ───────────────────────────
class Navbar extends StatelessWidget {
  final Function(int) onNavTap;

  const Navbar({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isDesktop(context) ? 120 : 60,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF0D0D0D),
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.08)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo / initials
          Text(
            'SBA.',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF6C63FF),
            ),
          ),

          // Nav links
          Row(
            children: List.generate(_navItems.length, (index) {
              return _NavLink(
                label: _navItems[index],
                onTap: () => onNavTap(index),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavLink({required this.label, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // MouseRegion gives hover effect on web
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(left: 32),
          padding: const EdgeInsets.only(bottom: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: _hovered
                    ? const Color(0xFF6C63FF)
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: _hovered ? const Color(0xFF6C63FF) : Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}

// ── Mobile drawer ─────────────────────────────────────────
class NavDrawer extends StatelessWidget {
  final Function(int) onNavTap;

  const NavDrawer({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1A1A2E),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'YN.',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF6C63FF),
              ),
            ),
          ),
          const Divider(color: Colors.white12),
          ...List.generate(_navItems.length, (index) {
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 24, vertical: 4,
              ),
              title: Text(
                _navItems[index],
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // close drawer
                onNavTap(index);
              },
            );
          }),
        ],
      ),
    );
  }
}