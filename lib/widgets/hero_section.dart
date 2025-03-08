import 'package:flutter/material.dart';
import 'package:hamza_folio/utils/url_launcher_utils.dart';
import 'package:hamza_folio/widgets/social_button_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    print("Hero Widget width📏📏📏: $size");
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ResponsiveRowColumn(
        rowMainAxisAlignment: MainAxisAlignment.center,
        layout: ResponsiveBreakpoints.of(context).largerThan(TABLET)
            ? ResponsiveRowColumnType.ROW
            : ResponsiveRowColumnType.COLUMN,
        children: [
          if (ResponsiveBreakpoints.of(context).smallerThan(TABLET))
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Container(
                padding: const EdgeInsets.all(32),
                child: Image.asset(
                  'assets/images/profile-image.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
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
          if (!ResponsiveBreakpoints.of(context).smallerThan(TABLET))
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Container(
                padding: const EdgeInsets.all(32),
                child: Image.asset(
                  'assets/images/profile-image.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
