// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _callService() async {
    final Uri url = Uri(scheme: 'tel', path: '+380630520335');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  void _openTelegram() async {
    final Uri url = Uri.parse('https://t.me/Artem_calabaraburus');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  void _openViber(BuildContext context) async {
    final Uri url = Uri.parse('viber://chat?number=%2B380630520335');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Не удалось открыть Viber')),
      );
    }
  }

  void _showMessengerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.telegram, color: Colors.white),
              title:
                  const Text('Telegram', style: TextStyle(color: Colors.white)),
              onTap: () => _openTelegram(),
            ),
            ListTile(
              leading: const Icon(Icons.message, color: Colors.white),
              title: const Text('Viber', style: TextStyle(color: Colors.white)),
              onTap: () => _openViber(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/logo_novatec.svg', height: 26),
            const SizedBox(width: 12),
            const Text('NovaTec Service'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: _callService,
              icon: const Icon(Icons.phone),
              label: const Text('Позвонить в сервис'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.red.shade700,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/callback'),
              icon: const Icon(Icons.schedule),
              label: const Text('Заказать обратный звонок'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.red.shade700,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => _showMessengerOptions(context),
              icon: const Icon(Icons.message),
              label: const Text('Написать в мессенджер'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.red.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
