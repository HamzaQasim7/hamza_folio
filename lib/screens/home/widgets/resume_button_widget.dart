import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:hamza_folio/utils/url_launcher_utils.dart';

class ResumeButtonWidget extends StatelessWidget {
  const ResumeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      hoverChild: InkWell(
        onTap: () => UrlLauncherUtils.launchUrl(
          'https://drive.google.com/file/d/1zMnPOwNHQlRm9fVyfJfI_2PGk7RpK7yq/view?usp=sharing',
        ),
        child: Text(
          'View Resume',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
      onHover: (event) {},
      child: InkWell(
        onTap: () => UrlLauncherUtils.launchUrl(
          'https://drive.google.com/file/d/1zMnPOwNHQlRm9fVyfJfI_2PGk7RpK7yq/view?usp=sharing',
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Resume',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
      ),
    );
  }
}
