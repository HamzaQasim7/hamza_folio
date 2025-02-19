import 'package:flutter/material.dart';
import 'package:hamza_folio/utils/url_launcher_utils.dart';
import 'package:hamza_folio/widgets/social_button_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 700,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ResponsiveRowColumn(
        rowMainAxisAlignment: MainAxisAlignment.center,
        layout: ResponsiveBreakpoints.of(context).largerThan(MOBILE)
            ? ResponsiveRowColumnType.ROW
            : ResponsiveRowColumnType.COLUMN,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
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
                        // This will use the theme's color by default
                      ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Building beautiful cross-platform applications\nwith Flutter and Dart',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 18),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    SocialButton(
                      message: 'Email',
                      imageUrl: 'assets/icons/email_img.png',
                      onTap: () => UrlLauncherUtils.launchEmail('hamzaqasim.co@gmail.com'),
                    ),
                    const SizedBox(width: 16),
                    SocialButton(
                      message: 'WhatsApp',
                      imageUrl: 'assets/icons/whatsapp_img.png',
                      onTap: () => UrlLauncherUtils.launchWhatsApp('+923197739591'),
                    ),
                    const SizedBox(width: 16),
                    SocialButton(
                      message: 'Github',
                      imageUrl: 'assets/icons/github_img.png',
                      onTap: () => UrlLauncherUtils.launchGitHub('HamzaQasim7'),
                    ),
                    const SizedBox(width: 16),
                    SocialButton(
                      message: 'LinkedIn',
                      imageUrl: 'assets/icons/linkedin_img.png',
                      onTap: () => UrlLauncherUtils.launchLinkedIn('hamzaqasim-flutterdeveloper'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Container(
              padding: const EdgeInsets.all(32),
              child: Image.asset(
                'assets/images/port_new_img.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
