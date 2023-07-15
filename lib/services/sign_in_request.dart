import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class SignInRequest {
//   signInGoogle() async {
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser!.authentication;
//     final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }
// }

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
