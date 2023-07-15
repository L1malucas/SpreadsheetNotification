import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spreadsheet_notifications/services/user_requests.dart';

class TestePage extends StatelessWidget {
  const TestePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    String userName = user != null ? user.displayName ?? 'Unknown' : 'Unknown';

    return Scaffold(
      appBar: AppBar(
        title: Text('\t\t Drive de $userName'),
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton<int>(
            onSelected: (item) => handleClick(item),
            itemBuilder: (context) => [
              const PopupMenuItem<int>(value: 0, child: Text('Sair')),
              const PopupMenuItem<int>(value: 1, child: Text('Sobre')),
              const PopupMenuItem<int>(value: 2, child: Text('Deletar Dados')),
            ],
          ),
          // IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Center(
        child: IconButton(
            onPressed: () async {
              await DeleteUserRequest().deleteUserAccount(context);
            },
            icon: const Icon(
              Icons.delete_forever,
              size: 48,
            )),
      ),
    );
  }
}

Future<void> handleClick(int item) async {
  switch (item) {
    case 0:
      break;
    case 1:
      break;
    case 2:
      // await DeleteUserRequest().deleteAllData();
      break;
  }
}
