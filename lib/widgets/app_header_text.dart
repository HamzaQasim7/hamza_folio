import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppHeaderText extends StatelessWidget {
  const AppHeaderText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 8,
          width: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
        )
      ],
    );
  }
}
