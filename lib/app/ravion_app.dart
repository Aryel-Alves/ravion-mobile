import 'package:flutter/material.dart';
import '../core/navigation/app_routes.dart';
import '../core/theme/app_theme.dart';
import '../features/core_loop/presentation/chat_page.dart';
import '../features/core_loop/presentation/entry_page.dart';
import '../features/core_loop/presentation/matchmaking_page.dart';
import '../features/core_loop/presentation/preferences_page.dart';
import '../features/common/presentation/placeholder_page.dart';
import '../features/shell/presentation/shell_page.dart';

class RavionApp extends StatelessWidget {
  const RavionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ravion',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      initialRoute: AppRoutes.entry,
      routes: {
        AppRoutes.shell: (_) => const ShellPage(),
        AppRoutes.entry: (_) => const EntryPage(),
        AppRoutes.preferences: (_) => const PreferencesPage(),
        AppRoutes.matchmaking: (_) => const MatchmakingPage(),
        AppRoutes.chat: (_) => const ChatPage(),
        AppRoutes.report: (_) => const PlaceholderPage(
          title: 'Denuncia',
          description: 'Selecione motivo e envie detalhes opcionalmente.',
        ),
        AppRoutes.settings: (_) => const PlaceholderPage(
          title: 'Configuracoes',
          description: 'Preferencias de conta, privacidade e ajuda.',
        ),
        AppRoutes.editProfile: (_) => const PlaceholderPage(
          title: 'Editar Perfil',
          description: 'Atualize nome de exibicao e avatar.',
        ),
      },
    );
  }
}
