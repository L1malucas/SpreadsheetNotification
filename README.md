# Spreadsheet Notification

Este é um projeto Flutter desenvolvido para capturar alterações em uma planilha do Google e notificar o usuário através de um aplicativo móvel. O objetivo principal é fornecer uma solução para monitorar e acompanhar as alterações em tempo real nos dados de uma planilha e enviar notificações push para o usuário do aplicativo.

## Funcionalidades

- Autenticação com API do Google: O aplicativo permite que os usuários façam login usando suas contas do Google, utilizando a autenticação OAuth2 para acessar a planilha.
- Monitoramento de planilha: O projeto está integrado com a API do Google Sheets para capturar alterações em tempo real na planilha especificada.
- Notificações push: Quando uma alteração é detectada na planilha, o aplicativo envia uma notificação push para informar o usuário sobre a mudança.
- Envio automático por e-mail: Além das notificações push, o aplicativo também oferece a opção de enviar um e-mail para o usuário contendo detalhes sobre as alterações na planilha.

## Pré-requisitos

- Flutter SDK: Certifique-se de ter o Flutter SDK instalado em sua máquina. Você pode obter o Flutter em: [https://flutter.dev](https://flutter.dev).
- Conta do Google: Você precisará de uma conta do Google para acessar a API do Google Sheets e configurar as credenciais de autenticação OAuth2.

## Configuração

1. Clone o repositório do projeto:

```
git clone https://github.com/seu-usuario/spreadsheet-notification.git
```

2. Acesse o diretório do projeto:

```
cd spreadsheet-notification
```

3. Execute o seguinte comando para obter as dependências do Flutter:

```
flutter pub get
```

4. Configure as credenciais do OAuth2:

   - Acesse a [APIs Console do Google](https://console.developers.google.com/).
   - Crie um novo projeto ou selecione um projeto existente.
   - Ative a API do Google Sheets para o projeto.
   - Crie as credenciais do OAuth2 e faça o download do arquivo JSON.
   - Renomeie o arquivo JSON para `client_secret.json` e mova-o para o diretório `assets/` do projeto.

5. Execute o aplicativo:

```
flutter run
```

## Personalização

Você pode personalizar o projeto de acordo com suas necessidades específicas. Aqui estão algumas áreas que você pode considerar personalizar:

- UI/UX: O layout e a aparência do aplicativo podem ser alterados modificando os arquivos em `lib/screens/` e `lib/widgets/`.
- Notificações push: Você pode personalizar o conteúdo e o comportamento das notificações push alterando a lógica em `lib/services/push_notification_service.dart`.
- Envio de e-mail: A lógica para o envio automático de e-mails pode ser encontrada em `lib/services/email_service.dart`. Você pode personalizar o formato e o conteúdo dos e-mails enviados.

## Contribuição

Contribuições são bem-vindas! Se você deseja contribuir com este projeto, siga as diretrizes de contribuição e envie uma pull request. Juntos, podemos tornar este projeto ainda melhor.

## Licença

Este projeto é licenciado sob a [MIT License](LICENSE). Sinta-se à vontade para usá-lo de acordo com os termos da licença.

## Agradecimentos

Agradecemos a todos os desenvolvedores que contribuíram para as bibliotecas e recursos de código aberto utilizados neste projeto. Seu trabalho é fundamental para o sucesso deste projeto.

google drive api e google auth com flutter
downloads necessarios
   - firebase_cli
   - keytools 
   - java
   - node
   - 
1. baixar as dependencias
   1.   url_launcher: ^6.1.11
   2.   google_sign_in: ^6.1.4
   3.   googleapis: ^11.3.0
   4.   firebase_auth: ^4.7.0
   5.   firebase_core: ^2.15.0
   6.   cloud_firestore: ^4.8.3
2. Configure um projeto no firebase
3. importar dependencias como 
	import 'package:googleapis/drive/v3.dart' as drive;
	import 'package:google_sign_in/google_sign_in.dart' as signIn;
4. chamada de função para login com google
	Future<void> _incrementCounter() async {
      final googleSignIn = signIn.GoogleSignIn.standard(scopes: [drive.DriveApi.DriveScope]);
      final signIn.GoogleSignInAccount account = await googleSignIn.signIn();
      print("User account $account");
   }  
   flutter fire erro Even after adding C:\Users\PC\AppData\Local\Pub\Cache\bin to the path for me flutterfire would not work from the command line, the reason being that it actually instally a flutterfire.bat file.

So I use flutterfire.bat in the command line as of now and that is working.