import 'package:url_launcher/url_launcher.dart' as url_launcher;

class UrlLauncherUtils {
  static Future<void> launchUrl(String url) async {
    try {
      if (!await url_launcher.launchUrl(Uri.parse(url))) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      throw Exception('Failed to launch URL: $e');
    }
  }

  // Commonly used URLs can be added as static methods
  static Future<void> launchEmail(String email) async {
    await launchUrl('mailto:$email');
  }

  static Future<void> launchWhatsApp(String phoneNumber) async {
    await launchUrl('https://wa.me/$phoneNumber');
  }

  static Future<void> launchGitHub(String username) async {
    await launchUrl('https://github.com/$username');
  }

  static Future<void> launchLinkedIn(String profile) async {
    await launchUrl('https://www.linkedin.com/in/$profile');
  }
} 