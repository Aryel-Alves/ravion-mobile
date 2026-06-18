# Ravion Mobile

App mobile do Ravion em Flutter.

## Setup rapido

1. Instale dependencias:
	- `flutter pub get`
2. Rode o app em desenvolvimento:
	- `flutter run`

## Como validar as modificacoes

Rode estes comandos na raiz do projeto:

1. Validar formatacao:
	- `dart format --set-exit-if-changed .`
2. Validar analise estatica:
	- `flutter analyze`
3. Rodar testes:
	- `flutter test`

Se todos passarem, o baseline local esta ok.

## Smoke test manual

Com um emulador/simulador aberto:

1. Inicie o app:
	- `flutter run`
2. Verifique se a tela inicial abre sem erro.
3. Navegue pelas abas principais e confirme que os placeholders aparecem.

## Validacao em CI

No pull request, a pipeline Mobile CI executa:

1. `dart format --set-exit-if-changed .`
2. `flutter analyze`
3. `flutter test`

Seu PR so deve ser considerado pronto quando esse job estiver verde.

## Referencias

- Backend e contratos: `docs/backend-reference.md`
