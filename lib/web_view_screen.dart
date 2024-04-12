import 'package:flutter/material.dart';
import 'package:flutter_git_blog/login_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String url;

  const WebViewScreen(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub 로그인'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onPageStarted: (String url) {
          // 페이지 로딩 시작 시 호출
        },
        onPageFinished: (String url) {
          // 페이지 로딩 완료 시 호출
          //const LoginPage().onUrlChanged(Uri.parse(url));
        },
        navigationDelegate: (NavigationRequest request) {
          // 페이지 네비게이션 요청 시 호출
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
