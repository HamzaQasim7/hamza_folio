import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamza_folio/core/config/constants/app_strings.dart';
import 'package:hamza_folio/widgets/app_header_text.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppHeaderText(text: 'About Me'),
          const SizedBox(height: 24),
          Text(
            AppStrings.aboutMe,
            style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1.6,
                  ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '''If you're seeking a skilled Flutter developer to breathe life into your project and exceed your expectations, I am here to collaborate and create magic together. Reach out, and let's transform your vision into a reality!''',
            style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1.6,
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
