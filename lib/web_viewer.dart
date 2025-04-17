import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewer extends StatefulWidget {
  const WebViewer({super.key});

  @override
  State<WebViewer> createState() => _WebViewerState();
}

class _WebViewerState extends State<WebViewer> {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
if (request.url.startsWith('whatsapp:') || request.url.startsWith('api.')) {
            launch(request.url);
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )..enableZoom(false)
    ..loadRequest(Uri.parse('https://tsmedu.in/'));



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller,),
    );
  }
}
