import 'package:flutter/material.dart';
import '../../../core/navigation/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import 'core_loop_state.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  static const _languages = ['pt-BR', 'en-US', 'es-ES'];
  static const _interestOptions = [
    'games',
    'musica',
    'filmes',
    'tecnologia',
    'esportes',
    'viagem',
  ];

  final _state = CoreLoopState.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preferencias')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.page),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Idioma', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: AppSpacing.md),
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                border: Border.all(color: AppColors.divider),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: DropdownButton<String>(
                  value: _state.language,
                  isExpanded: true,
                  underline: const SizedBox.shrink(),
                  items: _languages
                      .map(
                        (language) => DropdownMenuItem(
                          value: language,
                          child: Text(language),
                        ),
                      )
                      .toList(),
                  onChanged: (language) {
                    if (language == null) {
                      return;
                    }
                    setState(() {
                      _state.language = language;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'Interesses',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: _interestOptions.map((interest) {
                final isSelected = _state.interests.contains(interest);
                return ChoiceChip(
                  selected: isSelected,
                  label: Text(interest),
                  selectedColor: AppColors.accent,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  side: BorderSide(
                    color: isSelected ? AppColors.accent : AppColors.divider,
                  ),
                  backgroundColor: AppColors.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusPill),
                  ),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _state.interests.add(interest);
                      } else {
                        _state.interests.remove(interest);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: AppSpacing.buttonHeight,
              child: FilledButton(
                onPressed: _state.interests.isEmpty
                    ? null
                    : () => Navigator.pushNamed(context, AppRoutes.matchmaking),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                  ),
                ),
                child: const Text('Iniciar Matchmaking'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
