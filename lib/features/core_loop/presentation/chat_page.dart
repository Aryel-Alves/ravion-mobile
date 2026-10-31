import 'package:flutter/material.dart';
import '../../../core/navigation/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import 'core_loop_state.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textController = TextEditingController();
  final List<_ChatMessage> _messages = [
    const _ChatMessage(
      author: _Author.peer,
      text: 'Oi! Curte jogos de historia?',
    ),
    const _ChatMessage(
      author: _Author.me,
      text: 'Sim! To jogando um RPG novo.',
    ),
  ];
  bool _isPeerTyping = true;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = CoreLoopState.instance;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.peerDisplayName.isEmpty ? 'Anon' : state.peerDisplayName,
            ),
            Text(
              'Conversa ativa',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: _onNextPressed,
            child: const Text(
              'Next',
              style: TextStyle(color: AppColors.accent),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.page),
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isMe = message.author == _Author.me;

                return Align(
                  alignment: isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 260),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isMe ? AppColors.accent : AppColors.surface,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          isMe ? AppSpacing.radiusCard : 4,
                        ),
                        topRight: Radius.circular(
                          isMe ? 4 : AppSpacing.radiusCard,
                        ),
                        bottomLeft: const Radius.circular(
                          AppSpacing.radiusCard,
                        ),
                        bottomRight: const Radius.circular(
                          AppSpacing.radiusCard,
                        ),
                      ),
                      border: Border.all(
                        color: isMe ? AppColors.accent : AppColors.divider,
                      ),
                    ),
                    child: Text(
                      message.text,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isMe ? Colors.white : AppColors.textPrimary,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
              itemCount: _messages.length,
            ),
          ),
          if (_isPeerTyping)
            Padding(
              padding: const EdgeInsets.only(
                left: AppSpacing.page,
                right: AppSpacing.page,
                bottom: 8,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
                    border: Border.all(color: AppColors.divider),
                  ),
                  child: Text(
                    'digitando...',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.page),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    minLines: 1,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Digite uma mensagem',
                      filled: true,
                      fillColor: AppColors.surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusCard,
                        ),
                        borderSide: const BorderSide(color: AppColors.divider),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusCard,
                        ),
                        borderSide: const BorderSide(color: AppColors.divider),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                SizedBox(
                  height: AppSpacing.inputHeight,
                  width: AppSpacing.inputHeight,
                  child: FilledButton(
                    onPressed: _sendMessage,
                    style: FilledButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: AppColors.accent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Icon(Icons.send_rounded),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    final text = _textController.text.trim();
    if (text.isEmpty) {
      return;
    }

    setState(() {
      _isPeerTyping = false;
      _messages.add(_ChatMessage(author: _Author.me, text: text));
      _textController.clear();
    });
  }

  void _onNextPressed() {
    CoreLoopState.instance.resetConversation();
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.matchmaking,
      (route) => route.isFirst,
    );
  }
}

enum _Author { me, peer }

class _ChatMessage {
  const _ChatMessage({required this.author, required this.text});

  final _Author author;
  final String text;
}
