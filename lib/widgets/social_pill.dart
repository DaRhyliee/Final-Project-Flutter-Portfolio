import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Add this import
import '../theme/app_theme.dart';
import '../models/portfolio_model.dart';

class SocialPill extends StatelessWidget {
  final SocialLink link;

  const SocialPill({super.key, required this.link});

  // Function to handle opening the link
  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(link.handle);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchUrl,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipOval(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    link.iconAsset,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.link, color: AppTheme.primary),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              link.platform,
              style: AppTheme.sectionHeaderStyle.copyWith(fontSize: 12),
            ),
            Text(
              link.label,
              style: AppTheme.labelStyle.copyWith(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
