import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> openEmail(String email) async {
    final uri = Uri.parse('mailto:$email');
    await launchUrl(uri);
  }

  static Future<void> openResume() async {
    await openUrl('assets/resume/resume.pdf');
  }
}

// Usage anywhere in your app:
// UrlHelper.openUrl('https://linkedin.com/in/yourprofile');
// UrlHelper.openEmail('you@email.com');
// UrlHelper.openResume();