import 'package:flutter/material.dart';
import 'package:hamza_folio/core/config/constants/app_list.dart';
import 'package:hamza_folio/widgets/app_header_text.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../widgets/skill_card_widget.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textContext = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppHeaderText(text: 'Skills & Expertise'),
          const SizedBox(height: 48),
          ResponsiveGridView.builder(
            gridDelegate: const ResponsiveGridDelegate(
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              minCrossAxisExtent: 100,
              maxCrossAxisExtent: 200,
              crossAxisExtent: 150,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: AppLists.skills.length,
            itemBuilder: (context, index) {
              return SkillCardWidget(
                img: AppLists.skills[index]['img'] as String,
                name: AppLists.skills[index]['name'] as String,
              );
            },
          ),
        ],
      ),
    );
  }
}
