import 'package:flutter/material.dart';
import '../core/navigation/app_routes.dart';
import '../core/theme/app_theme.dart';
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
      initialRoute: AppRoutes.shell,
      routes: {
        AppRoutes.shell: (_) => const ShellPage(),
        AppRoutes.entry: (_) => const PlaceholderPage(
          title: 'Entrada',
          description: 'Confirme 18+ e aceite os termos para continuar.',
        ),
        AppRoutes.preferences: (_) => const PlaceholderPage(
          title: 'Preferencias',
          description: 'Selecione idioma e interesses para matchmaking.',
        ),
        AppRoutes.matchmaking: (_) => const PlaceholderPage(
          title: 'Matchmaking',
          description: 'Procurando alguem com preferencias compativeis...',
        ),
        AppRoutes.chat: (_) => const PlaceholderPage(
          title: 'Chat Ativo',
          description: 'Bubbles, typing indicator e acao Next.',
        ),
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
