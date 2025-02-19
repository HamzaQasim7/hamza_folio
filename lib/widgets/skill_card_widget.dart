import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hamza_folio/core/config/theme/app_theme.dart';

class SkillCardWidget extends StatelessWidget {
  final String name;
  final String img;

  const SkillCardWidget({
    super.key,
    required this.name,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(img, width: 35, height: 35),
            const SizedBox(height: 8),
            Text(
              name,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
