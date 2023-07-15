// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spreadsheet_notifications/pages/login_page.dart';

class SignInRequest {
  Future<bool> signInGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      return true; // Login bem-sucedido
    } catch (error) {
      print('Erro no login: $error');
      return false; // Login falhou
    }
  }
}

class DeleteUserRequest {
  Future<void> deleteUserAccount(BuildContext context) async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
      await _reauthenticateAndDelete();
      // Navegar de volta à tela de login após excluir a conta do usuário
      // Navigator.pushNamedAndRemoveUntil(
      //     context, '/login_page', (Route<dynamic> route) => false);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (Route<dynamic> route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == "requires-recent-login") {
        await _reauthenticateAndDelete();
        // Navegar de volta à tela de login após excluir a conta do usuário
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (Route<dynamic> route) => false);
      } else {
        // Lidar com outras exceções do Firebase
        print(e);
      }
    } catch (e) {
      // Lidar com exceções gerais
      print(e);
    }
  }

  Future<void> _reauthenticateAndDelete() async {
    try {
      final providerData =
          FirebaseAuth.instance.currentUser?.providerData.first;

      if (AppleAuthProvider().providerId == providerData!.providerId) {
        await FirebaseAuth.instance.currentUser!
            .reauthenticateWithProvider(AppleAuthProvider());
      } else if (GoogleAuthProvider().providerId == providerData.providerId) {
        await FirebaseAuth.instance.currentUser!
            .reauthenticateWithProvider(GoogleAuthProvider());
      }

      await FirebaseAuth.instance.currentUser?.delete();
    } catch (e) {
      // Lidar com exceções
    }
  }
}
