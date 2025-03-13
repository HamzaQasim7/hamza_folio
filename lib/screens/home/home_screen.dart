import 'dart:math';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
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

  static final GlobalKey heroKey = GlobalKey();
  static final GlobalKey aboutKey = GlobalKey();
  static final GlobalKey projectsKey = GlobalKey();
  static final GlobalKey skillsKey = GlobalKey();
  static final GlobalKey contactsKey = GlobalKey();

  void _scrollToSection(BuildContext context, GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);

    return Scaffold(
      // Show top app bar only for desktop
      appBar: isDesktop
          ? PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: Container(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.8),
                child: _DesktopNavBar(),
              ),
            )
          : AppBar(
              backgroundColor:
                  Theme.of(context).colorScheme.surface.withOpacity(0.8),
              title: Text(
                'HQ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 24,
                    ),
              ),
              actions: [
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                  ),
                ),
              ],
            ),
      // Side drawer for mobile and tablet
      endDrawer: !isDesktop ? const _MobileDrawer() : null,
      body: Stack(
        children: [
          // Animated Background
          const AnimatedBackground(),

          // Main Content
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    HeroSection(key: heroKey),
                    AboutSection(key: aboutKey),
                    ProjectsSection(key: projectsKey),
                    SkillsSection(key: skillsKey),
                    ContactSection(key: contactsKey),
                  ],
                ),
              ),
            ],
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
          InkWell(
            onTap: () => Scrollable.ensureVisible(
              MyHomePage.heroKey.currentContext!,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            ),
            child: Text(
              'HQ',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Row(
            children: [
              NavItemWidget(
                title: 'ABOUT',
                onTap: () => Scrollable.ensureVisible(
                  MyHomePage.aboutKey.currentContext!,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                ),
              ),
              NavItemWidget(
                title: 'PROJECTS',
                onTap: () => Scrollable.ensureVisible(
                  MyHomePage.projectsKey.currentContext!,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                ),
              ),
              NavItemWidget(
                title: 'SKILLS',
                onTap: () => Scrollable.ensureVisible(
                  MyHomePage.skillsKey.currentContext!,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                ),
              ),
              NavItemWidget(
                title: 'CONTACTS',
                onTap: () => Scrollable.ensureVisible(
                  MyHomePage.contactsKey.currentContext!,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                ),
              ),
              const SizedBox(width: 24),
              const ResumeButtonWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

// New Drawer Widget
class _MobileDrawer extends StatelessWidget {
  const _MobileDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: GlassmorphicContainer(
        width: double.infinity,
        height: double.infinity,
        borderRadius: 0,
        blur: 10,
        border: 0,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.surface.withOpacity(0.9),
            Theme.of(context).colorScheme.surface.withOpacity(0.8),
          ],
        ),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.surface.withOpacity(0.5),
            Theme.of(context).colorScheme.surface.withOpacity(0.5),
          ],
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Drawer Header
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Menu',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              const Divider(),
              // Navigation Items
              _DrawerItem(
                title: 'About',
                icon: Icons.person_outline,
                onTap: () {
                  Navigator.pop(context);
                  Scrollable.ensureVisible(
                    MyHomePage.aboutKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              _DrawerItem(
                title: 'Projects',
                icon: Icons.work_outline,
                onTap: () {
                  Navigator.pop(context);
                  Scrollable.ensureVisible(
                    MyHomePage.projectsKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              _DrawerItem(
                title: 'Skills',
                icon: Icons.code,
                onTap: () {
                  Navigator.pop(context);
                  Scrollable.ensureVisible(
                    MyHomePage.skillsKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              _DrawerItem(
                title: 'Contact',
                icon: Icons.mail_outline,
                onTap: () {
                  Navigator.pop(context);
                  Scrollable.ensureVisible(
                    MyHomePage.contactsKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              const Divider(),
              // Resume Button
              const Spacer(),
              const Padding(
                padding: EdgeInsets.all(16),
                child: ResumeButtonWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// New Drawer Item Widget
class _DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
      ),
      onTap: onTap,
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

// Add this new class for the animated background
class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  final List<_FloatingCircle> circles = [];
  final random = Random();
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    // Only initialize controllers here
    _controllers = List.generate(
      15,
      (index) => AnimationController(
        duration: Duration(seconds: 3 + random.nextInt(5)),
        vsync: this,
      ),
    );

    _animations = _controllers.map((controller) {
      return Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            controller.reverse();
          } else if (status == AnimationStatus.dismissed) {
            controller.forward();
          }
        });
    }).toList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      // Initialize circles here where we can safely access Theme
      circles.clear();
      for (int i = 0; i < 15; i++) {
        circles.add(
          _FloatingCircle(
            x: random.nextDouble(),
            y: random.nextDouble(),
            size: 20 + random.nextDouble() * 40,
            color: i % 2 == 0
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
          ),
        );
      }

      // Start animations with different delays
      for (var i = 0; i < _controllers.length; i++) {
        Future.delayed(
          Duration(milliseconds: random.nextInt(2000)),
          () {
            if (mounted) {
              _controllers[i].forward();
            }
          },
        );
      }
      _initialized = true;
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(
        circles.length,
        (index) => AnimatedBuilder(
          animation: _animations[index],
          builder: (context, child) {
            final circle = circles[index];
            final animation = _animations[index].value;

            // Calculate position with smooth movement
            final dx = sin(animation * pi * 2) * 50;
            final dy = cos(animation * pi * 2) * 50;

            return Positioned(
              left: MediaQuery.of(context).size.width * circle.x + dx,
              top: MediaQuery.of(context).size.height * circle.y + dy,
              child: GlassmorphicContainer(
                width: circle.size,
                height: circle.size,
                borderRadius: circle.size / 2,
                blur: 10,
                border: 0,
                linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    circle.color.withOpacity(0.1),
                    circle.color.withOpacity(0.05),
                  ],
                ),
                borderGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    circle.color.withOpacity(0.2),
                    circle.color.withOpacity(0.1),
                  ],
                ),
                child: Container(),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Helper class to store circle properties
class _FloatingCircle {
  final double x;
  final double y;
  final double size;
  final Color color;

  _FloatingCircle({
    required this.x,
    required this.y,
    required this.size,
    required this.color,
  });
}
