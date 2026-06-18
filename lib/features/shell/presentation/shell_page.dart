import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';

class ShellPage extends StatefulWidget {
  const ShellPage({super.key});

  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  int _currentIndex = 0;

  static const _tabs = [
    _TabContent(
      title: 'Historico',
      description: 'Lista de conversas recentes (retencao de 30 dias).',
      icon: Icons.chat_bubble_outline,
    ),
    _TabContent(
      title: 'Nova conversa',
      description: 'Tela de matchmaking base pronta para integrar Socket.IO.',
      icon: Icons.bolt_outlined,
    ),
    _TabContent(
      title: 'Ajustes',
      description: 'Preferencias, seguranca e editar perfil.',
      icon: Icons.settings_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final tab = _tabs[_currentIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('Ravion')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.page),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tab.title, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: AppSpacing.md),
            Text(tab.description, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: AppSpacing.lg),
            Container(
              height: 52,
              decoration: BoxDecoration(
                color: AppColors.accentSoft,
                borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Text(
                'Base da Onda 0: navegacao + tokens aplicada.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        destinations: _tabs
            .map(
              (tabItem) => NavigationDestination(
                icon: Icon(tabItem.icon),
                label: tabItem.title,
              ),
            )
            .toList(),
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class _TabContent {
  const _TabContent({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}
