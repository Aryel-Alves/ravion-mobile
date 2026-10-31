class CoreLoopState {
  static final CoreLoopState instance = CoreLoopState._();

  CoreLoopState._();

  String language = 'pt-BR';
  final Set<String> interests = <String>{'games'};

  String activeConversationId = '';
  String peerDisplayName = '';

  void resetConversation() {
    activeConversationId = '';
    peerDisplayName = '';
  }
}
