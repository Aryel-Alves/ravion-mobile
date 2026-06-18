import 'package:flutter/material.dart';
import '../../../core/theme/app_spacing.dart';

class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.page),
        child: Text(description, style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }
}
