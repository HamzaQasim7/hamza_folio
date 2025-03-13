import 'package:flutter/material.dart';
import 'package:hamza_folio/core/config/theme/app_theme.dart';
import 'package:hamza_folio/utils/url_launcher_utils.dart';
import 'package:hamza_folio/widgets/social_button_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:glassmorphism/glassmorphism.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ResponsiveRowColumn(
        rowMainAxisAlignment: MainAxisAlignment.center,
        layout: isDesktop
            ? ResponsiveRowColumnType.ROW
            : ResponsiveRowColumnType.COLUMN,
        children: [
          // Content Section (First in desktop, Second in mobile)
          ResponsiveRowColumnItem(
            rowFlex: 1,
            columnOrder: 2, // Second in mobile/tablet
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'WELCOME TO MY PORTFOLIO ✋',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                const SizedBox(height: 16),
                Text(
                  "I'm Hamza Qasim",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: ResponsiveValue(
                          context,
                          defaultValue: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.fontSize ??
                              48.0,
                          conditionalValues: [
                            Condition.largerThan(
                              name: TABLET,
                              value: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.fontSize ??
                                  72.0,
                            ),
                            Condition.smallerThan(
                              name: MOBILE,
                              value: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.fontSize ??
                                  36.0,
                            ),
                          ],
                        ).value,
                        height: 1.1,
                      ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Building result driven cross-platform applications\nwith Flutter and Dart',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 18),
                ),
                const SizedBox(height: 40),
                ResponsiveRowColumn(
                  layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  rowSpacing: 16,
                  columnSpacing: 16,
                  children: [
                    ResponsiveRowColumnItem(
                      child: SocialButton(
                        message: 'Email',
                        imageUrl: 'assets/icons/email_img.png',
                        onTap: () => UrlLauncherUtils.launchEmail(
                            'hamzaqasim.co@gmail.com'),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: SocialButton(
                        message: 'WhatsApp',
                        imageUrl: 'assets/icons/whatsapp_img.png',
                        onTap: () =>
                            UrlLauncherUtils.launchWhatsApp('+923197739591'),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: SocialButton(
                        message: 'Github',
                        imageUrl: 'assets/icons/github_img.png',
                        onTap: () =>
                            UrlLauncherUtils.launchGitHub('HamzaQasim7'),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: SocialButton(
                        message: 'LinkedIn',
                        imageUrl: 'assets/icons/linkedin_img.png',
                        onTap: () => UrlLauncherUtils.launchLinkedIn(
                            'hamzaqasim-flutterdeveloper'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Modern Profile Image Section
          ResponsiveRowColumnItem(
            rowFlex: 1,
            columnOrder: 1,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Background gradient circle
                Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary.withOpacity(0.2),
                        Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                      ],
                    ),
                  ),
                ),
                // Glassmorphic container
                GlassmorphicContainer(
                  width: 350,
                  height: 350,
                  borderRadius: 175,
                  blur: 20,
                  alignment: Alignment.center,
                  border: 2,
                  linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.1),
                      const Color(0xFFFFFFFF).withOpacity(0.05),
                    ],
                  ),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.5),
                      const Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Stack(
                      children: [
                        // Profile image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(150),
                          child: Image.asset(
                            'assets/images/profile-image.png',
                            fit: BoxFit.cover,
                            width: 300,
                            height: 300,
                          ),
                        ),
                        // Floating effect circles
                        ...List.generate(
                          3,
                          (index) => Positioned(
                            left: index * 100.0,
                            top: index * 80.0,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Animated border
                TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(seconds: 2),
                  builder: (context, value, child) {
                    return Transform.rotate(
                      angle: value * 2 * 3.14,
                      child: Container(
                        width: 380,
                        height: 380,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                            width: 2,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
