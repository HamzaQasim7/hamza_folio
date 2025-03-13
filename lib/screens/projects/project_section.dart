import 'package:flutter/material.dart';
import 'package:hamza_folio/utils/url_launcher_utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../core/config/constants/app_list.dart';
import '../../widgets/app_header_text.dart';
import '../../widgets/project_card_widget.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppHeaderText(text: 'Recent Work'),
          const SizedBox(height: 48),
          ResponsiveGridView.builder(
            gridDelegate: const ResponsiveGridDelegate(
              crossAxisSpacing: 32,
              mainAxisSpacing: 32,
              minCrossAxisExtent: 200,
              maxCrossAxisExtent: 450,
              crossAxisExtent: 320,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return ProjectCardWidget(
                title: AppLists.projects[index]['title']!,
                description: AppLists.projects[index]['description']!,
                imageUrl: AppLists.projects[index]['image']!,
                onTap: () => UrlLauncherUtils.launchUrl(
                    AppLists.projects[index]['url']!),
              );
            },
          ),
        ],
      ),
    );
  }
}
