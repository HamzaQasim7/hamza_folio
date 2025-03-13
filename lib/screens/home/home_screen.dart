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
    return Scaffold(
      body: Stack(
        children: [
          // Animated Background with floating circles
          const AnimatedBackground(),
          
          // Main Content
          CustomScrollView(
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
              InkWell(
                onTap: () {
                  if (_isMenuOpen) _toggleMenu();
                  Scrollable.ensureVisible(
                    MyHomePage.heroKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  'HQ',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 24,
                      ),
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
                    title: 'About',
                    onTap: () {
                      _toggleMenu();
                      Scrollable.ensureVisible(
                        MyHomePage.aboutKey.currentContext!,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  _MobileMenuItem(
                    title: 'Projects',
                    onTap: () {
                      _toggleMenu();
                      Scrollable.ensureVisible(
                        MyHomePage.projectsKey.currentContext!,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  _MobileMenuItem(
                    title: 'Skills',
                    onTap: () {
                      _toggleMenu();
                      Scrollable.ensureVisible(
                        MyHomePage.skillsKey.currentContext!,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  _MobileMenuItem(
                    title: 'Contact',
                    onTap: () {
                      _toggleMenu();
                      Scrollable.ensureVisible(
                        MyHomePage.contactsKey.currentContext!,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
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
