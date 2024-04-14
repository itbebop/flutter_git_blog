import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final String clientId = 'YOUR_GITHUB_CLIENT_ID';
  final String clientSecret = 'YOUR_GITHUB_CLIENT_SECRET';
  final String redirectUri = 'YOUR_GITHUB_REDIRECT_URI';
  final String scope = 'repo'; // 레포지토리에 대한 읽기 및 쓰기 권한

  String? accessToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub 로그인'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _handleGitHubSignIn;
          },
          child: const Text('GitHub으로 로그인'),
        ),
      ),
    );
  }

  void _handleGitHubSignIn() async {
    final authorizationUrl = 'https://github.com/login/oauth/authorize?client_id=$clientId&redirect_uri=$redirectUri&scope=$scope';

    if (await launchUrl(Uri.parse(authorizationUrl))) {
      await launchUrl(Uri.parse(authorizationUrl));
    } else {
      throw 'Could not launch $authorizationUrl';
    }
  }

  Future<void> onUrlChanged(Uri uri) async {
    if (uri.toString().startsWith(redirectUri)) {
      final code = uri.queryParameters['code'];
      if (code != null) {
        final tokenResponse = await _getAccessToken(code);
        if (tokenResponse.statusCode == 200) {
          final tokenData = Uri.splitQueryString(tokenResponse.body);
          final token = tokenData['access_token'];
          setState(() {
            accessToken = token;
          });
        } else {
          throw Exception('Failed to get access token');
        }
      }
    }
  }

  Future<http.Response> _getAccessToken(String code) {
    const tokenUrl = 'https://github.com/login/oauth/access_token';
    final headers = {'Accept': 'application/json'};
    final body = {
      'client_id': clientId,
      'client_secret': clientSecret,
      'code': code,
      'redirect_uri': redirectUri,
    };
    return http.post(Uri.parse(tokenUrl), headers: headers, body: body);
  }
}
