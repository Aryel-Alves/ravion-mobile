# Ravion Mobile

App mobile do Ravion em Flutter.

## Setup rapido

1. Instale dependencias:
	- `flutter pub get`
2. Rode o app em desenvolvimento:
	- `flutter run`

## Android no WSL com emulador Windows

Use o Flutter e o Android SDK de **Linux** no WSL para compilar o app.
Use o Android Studio, o emulador e o servidor ADB de **Windows** no Windows.
Nao aponte o Flutter Linux para o SDK Windows em `/mnt/c/...`.

### Configuracao inicial (uma vez)

1. No WSL, configure o SDK Linux. Neste ambiente ele esta em
   `/usr/lib/android-sdk`; ajuste o caminho se sua instalacao for diferente:

   ```bash
   export PATH="$PATH:$HOME/flutter/bin"
   export ANDROID_HOME=/usr/lib/android-sdk
   export ANDROID_SDK_ROOT="$ANDROID_HOME"
   export PATH="$PATH:$ANDROID_HOME/platform-tools"
   export ADB_SERVER_SOCKET=tcp:127.0.0.1:5037
   flutter config --android-sdk "$ANDROID_HOME"
   ```

   Adicione os comandos `export` ao `~/.bashrc` para persistir a configuracao,
   removendo definicoes antigas ou conflitantes. Reabra o terminal.
   O arquivo local `android/local.properties` tambem deve usar o SDK Linux:

   ```properties
   sdk.dir=/usr/lib/android-sdk
   ```

   Preserve as demais propriedades desse arquivo.

2. No Windows 11 22H2 ou superior com WSL atualizado, crie ou edite
   `%UserProfile%\.wslconfig` e adicione a opcao abaixo na secao `[wsl2]`,
   preservando outras configuracoes:

   ```ini
   [wsl2]
   networkingMode=mirrored
   ```

   A rede espelhada permite que WSL e Windows compartilhem `127.0.0.1`
   para acessar o servidor ADB e as portas de depuracao.

3. Salve seu trabalho e execute **no PowerShell Windows**:

   ```powershell
   wsl --shutdown
   ```

   Isso encerra todas as distribuicoes WSL e seus servicos. Reabra o WSL
   e o VS Code conectado a ele.

4. No WSL, revise as licencas e confira as ferramentas:

   ```bash
   flutter doctor --android-licenses
   flutter doctor -v
   ```

   Leia as licencas antes de aceita-las. O aviso sobre Chrome ausente nao
   impede o desenvolvimento Android.

### Iniciar o emulador (Windows)

No **Android Studio Windows > Device Manager**, clique em **Play** no
emulador desejado e espere a tela inicial do Android aparecer.
Neste ambiente o emulador se chama `Pixel_7`.

Como alternativa, execute **no PowerShell Windows**:

```powershell
& "$env:LOCALAPPDATA\Android\Sdk\emulator\emulator.exe" -avd Pixel_7
```

Se esse comando ocupar o terminal, abra outra aba do PowerShell.
Inicie o servidor ADB e confirme a conexao:

```powershell
& "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe" start-server
& "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe" devices -l
```

O resultado deve conter um emulador no estado `device`, por exemplo:

```text
List of devices attached
emulator-5554    device ...
```

**Os comandos com `& "$env:..."` sao de PowerShell, nao de Bash.**
Para executar o ADB Windows a partir do WSL, use o caminho do executavel
(ajuste o usuario Windows):

```bash
/mnt/c/Users/aryel/AppData/Local/Android/Sdk/platform-tools/adb.exe start-server
/mnt/c/Users/aryel/AppData/Local/Android/Sdk/platform-tools/adb.exe devices -l
```

### Rodar o app (WSL)

Mantenha o emulador aberto no Windows. No **terminal WSL**, execute:

```bash
cd ~/projects/ravion-mobile
adb devices -l
flutter devices
flutter pub get
flutter run -d emulator-5554
```

Ajuste o caminho do projeto e use o ID exibido por `flutter devices` se
for diferente de `emulator-5554`. A primeira compilacao pode levar alguns
minutos. Com o app rodando, pressione `r` para hot reload, `R` para hot
restart ou `q` para encerrar.

### Problemas comuns

| Sintoma | O que conferir |
| --- | --- |
| Bash mostra `syntax error near unexpected token '&'` | O comando e de PowerShell. Execute no PowerShell Windows ou use o caminho `/mnt/c/.../adb.exe` no WSL. |
| ADB Windows mostra apenas `List of devices attached` | Nenhum dispositivo foi detectado. Inicie o emulador no Device Manager e aguarde o Android abrir. |
| WSL mostra `Connection refused` em `127.0.0.1:5037` | Confirme a rede espelhada, reinicie o WSL apos configurar e execute `adb.exe start-server` no Windows. |
| Emulador aparece como `offline` | Aguarde a inicializacao e consulte `adb.exe devices -l` novamente no Windows. |
| Flutter procura o SDK em `/mnt/c/...` ou acusa `cmdline-tools` ausente | Confira `flutter config --list`, as variaveis Android e `android/local.properties`. Use o SDK Linux e instale nele as Command-line Tools se estiverem ausentes. |
| Compilacao reclama de licencas Android | Execute `flutter doctor --android-licenses` no WSL e revise os termos. |

Se o Windows detectar o emulador, mas o WSL nao, compare as saidas de
`adb.exe devices -l` no Windows, `adb devices -l` no WSL e `flutter doctor -v`.
Nao exponha o servidor ADB na rede publica nem desative o firewall.

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
