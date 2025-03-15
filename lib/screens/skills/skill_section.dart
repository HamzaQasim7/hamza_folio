import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:hamza_folio/core/config/constants/app_list.dart';
import 'package:hamza_folio/widgets/app_header_text.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../widgets/skill_card_widget.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
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
            itemCount: AppLists.topSkills.length,
            itemBuilder: (context, index) {
              return SkillCardWidget(
                img: AppLists.topSkills[index]['img'] as String,
                name: AppLists.topSkills[index]['name'] as String,
              );
            },
          ),
          const SizedBox(height: 32),
          Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const AllSkillsDialog(),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'View All Skills',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Create a new dialog to show all skills
class AllSkillsDialog extends StatelessWidget {
  const AllSkillsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: GlassmorphicContainer(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.8,
        borderRadius: 20,
        blur: 20,
        border: 2,
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
        child: Column(
          children: [
            // Dialog Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Skills',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const Divider(),
            // Skills Grid
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _SkillCategory(
                      title: 'Core Technologies',
                      skills: AppLists.allSkills
                          .where((skill) => [
                                'Flutter',
                                'Dart',
                                'Firebase',
                                'REST APIs'
                              ].contains(skill['name']))
                          .toList(),
                    ),
                    _SkillCategory(
                      title: 'State Management',
                      skills: AppLists.allSkills
                          .where((skill) => ['Provider', 'Bloc', 'GetX']
                              .contains(skill['name']))
                          .toList(),
                    ),
                    _SkillCategory(
                      title: 'Databases & Backend',
                      skills: AppLists.allSkills
                          .where((skill) => [
                                'SQLite',
                                'Hive',
                                'Firebase',
                                'Supabase'
                              ].contains(skill['name']))
                          .toList(),
                    ),
                    _SkillCategory(
                      title: 'Development Tools',
                      skills: AppLists.allSkills
                          .where((skill) => [
                                'Git',
                                'GitHub',
                                'VS Code',
                                'Android Studio'
                              ].contains(skill['name']))
                          .toList(),
                    ),
                    _SkillCategory(
                      title: 'Testing & Quality',
                      skills: AppLists.allSkills
                          .where((skill) => [
                                'Unit Testing',
                                'Widget Testing',
                                'Integration Testing'
                              ].contains(skill['name']))
                          .toList(),
                    ),
                    _SkillCategory(
                      title: 'Design & UI/UX',
                      skills: AppLists.allSkills
                          .where((skill) => [
                                'UI/UX Design',
                                'Figma',
                                'Adobe XD',
                                'Material Design'
                              ].contains(skill['name']))
                          .toList(),
                    ),
                    _SkillCategory(
                      title: 'Real-time Technologies',
                      skills: AppLists.allSkills
                          .where((skill) => ['WebRTC', 'WebSocket', 'Stream']
                              .contains(skill['name']))
                          .toList(),
                    ),
                    _SkillCategory(
                      title: 'Cloud Services',
                      skills: AppLists.allSkills
                          .where((skill) =>
                              ['Google Cloud'].contains(skill['name']))
                          .toList(),
                    ),
                    _SkillCategory(
                      title: 'CI/CD',
                      skills: AppLists.allSkills
                          .where((skill) => ['GitHub Actions', 'Codemagic']
                              .contains(skill['name']))
                          .toList(),
                    ),
                    _SkillCategory(
                      title: 'App Performance',
                      skills: AppLists.allSkills
                          .where((skill) => [
                                'App Optimization',
                                'Performance Profiling'
                              ].contains(skill['name']))
                          .toList(),
                    ),
                    _SkillCategory(
                      title: 'Cross-Platform',
                      skills: AppLists.allSkills
                          .where((skill) => [
                                'iOS Development',
                                'Android Development',
                                'Web Development'
                              ].contains(skill['name']))
                          .toList(),
                    ),
                    _SkillCategory(
                      title: 'Additional Programming Languages',
                      skills: AppLists.allSkills
                          .where((skill) =>
                              ['C++', 'Python', 'Java'].contains(skill['name']))
                          .toList(),
                    ),
                    _SkillCategory(
                      title: 'Project Management',
                      skills: AppLists.allSkills
                          .where((skill) => ['Agile', 'Scrum', 'Slack']
                              .contains(skill['name']))
                          .toList(),
                    ),
                    const SizedBox(height: 32), // Bottom padding
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper widget for skill categories
class _SkillCategory extends StatelessWidget {
  final String title;
  final List<Map<String, String>> skills;

  const _SkillCategory({
    required this.title,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ResponsiveGridView.builder(
          gridDelegate: const ResponsiveGridDelegate(
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            minCrossAxisExtent: 100,
            maxCrossAxisExtent: 150,
            crossAxisExtent: 120,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: skills.length,
          itemBuilder: (context, index) {
            return SkillCardWidget(
              img: skills[index]['img']!,
              name: skills[index]['name']!,
            );
          },
        ),
      ],
    );
  }
}
