import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;
  final String? message;

  const SocialButton({
    super.key,
    required this.imageUrl,
    required this.onTap,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Tooltip(
        message: message,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.primary),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[300]!,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child:
              Image.asset(imageUrl, width: 60, height: 60, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
