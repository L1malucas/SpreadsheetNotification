import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Uri _urlLinkedinProfile =
      Uri.parse('https://www.linkedin.com/in/limalucasdev/');
  final Uri _urlGithubRepo = Uri.parse('https://github.com/L1malucas/JwtApi');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  print('object');
                },
                child: SizedBox(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/google-icon.png'),
                      const SizedBox(width: 18),
                      const Text(
                        "Sign In",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: InkWell(
              hoverColor: Colors.transparent,
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/174/174857.png',
                width: 48,
                height: 48,
              ),
              onTap: () => launchUrl(_urlLinkedinProfile,
                  mode: LaunchMode.externalApplication),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              hoverColor: Colors.transparent,
              child: Image.network(
                'https://img.icons8.com/?size=512&id=12599&format=png',
                width: 48,
                height: 48,
              ),
              onTap: () => launchUrl(_urlGithubRepo,
                  mode: LaunchMode.externalApplication),
            ),
          )
        ],
      ),
    );
  }
}
