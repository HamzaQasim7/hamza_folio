import 'package:flutter/material.dart';
import 'package:hamza_folio/screens/about/about_section.dart';
import 'package:hamza_folio/screens/contact/contact_section.dart';
import 'package:hamza_folio/screens/home/widgets/nav_items_widget.dart';
import 'package:hamza_folio/screens/home/widgets/resume_button_widget.dart';
import 'package:hamza_folio/widgets/hero_section.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../projects/project_section.dart';
import '../skills/skill_section.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor:
                Theme.of(context).colorScheme.surface.withOpacity(0.8),
            elevation: 0,
            expandedHeight: 80,
            flexibleSpace: FlexibleSpaceBar(
              background: ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                  ? _DesktopNavBar()
                  : _MobileNavBar(),
            ),
          ),
          const SliverToBoxAdapter(
            child: Column(
              children: [
                HeroSection(),
                AboutSection(),
                ProjectsSection(),
                SkillsSection(),
                ContactSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DesktopNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'HQ',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Row(
            children: [
              NavItemWidget(title: 'ABOUT', onTap: () {}),
              NavItemWidget(title: 'PROJECTS', onTap: () {}),
              NavItemWidget(title: 'SKILLS', onTap: () {}),
              NavItemWidget(title: 'CONTACTS', onTap: () {}),
              const SizedBox(width: 24),
              const ResumeButtonWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

class _MobileNavBar extends StatefulWidget {
  @override
  State<_MobileNavBar> createState() => _MobileNavBarState();
}

class _MobileNavBarState extends State<_MobileNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
      if (_isMenuOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'HQ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 24,
                    ),
              ),
              IconButton(
                icon: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  progress: _animation,
                ),
                onPressed: _toggleMenu,
              ),
            ],
          ),
        ),
        // Mobile Menu Overlay
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _isMenuOpen ? 280 : 0,
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _MobileMenuItem(
                    title: 'Projects',
                    onTap: () {
                      _toggleMenu();
                      Scrollable.ensureVisible(
                        context,
                        duration:
                            // Replace with your project section's global key
                            const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  _MobileMenuItem(
                    title: 'Skills',
                    onTap: () {
                      _toggleMenu();
                      // Add scroll to skills section
                    },
                  ),
                  _MobileMenuItem(
                    title: 'Contact',
                    onTap: () {
                      _toggleMenu();
                      // Add scroll to contact section
                    },
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle resume download or view
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Resume',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _MobileSocialButton(
                        icon: Icons.email_outlined,
                        onTap: () {},
                      ),
                      const SizedBox(width: 16),
                      _MobileSocialButton(
                        icon: Icons.code,
                        onTap: () {},
                      ),
                      const SizedBox(width: 16),
                      _MobileSocialButton(
                        icon: Icons.person_outline,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MobileMenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _MobileMenuItem({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}

class _MobileSocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _MobileSocialButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
