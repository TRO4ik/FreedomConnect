import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const FreedomConnectApp());

class FreedomConnectApp extends StatelessWidget {
  const FreedomConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freedom Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF397A68)),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static final Uri torDownload =
      Uri.parse('https://www.torproject.org/download/');
  static final Uri torCheck =
      Uri.parse('https://check.torproject.org/');

  Future<void> _open(Uri uri, BuildContext context) async {
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Не удалось открыть ссылку. Проверьте подключение.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FREEDOM CONNECT'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                children: const [
                  Icon(Icons.shield_outlined, size: 54, color: Color(0xFF397A68)),
                  SizedBox(height: 12),
                  Text(
                    'Ваш центр подключения',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Это бесплатное приложение-помощник. Оно открывает официальные инструменты и проверочную страницу, но само не создаёт VPN-туннель и не перенаправляет трафик устройства.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          const Text('Быстрые действия',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          FilledButton.icon(
            onPressed: () => _open(torDownload, context),
            icon: const Icon(Icons.download_outlined),
            label: const Text('Официальная загрузка Tor Browser'),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: () => _open(torCheck, context),
            icon: const Icon(Icons.verified_user_outlined),
            label: const Text('Проверить Tor в браузере'),
          ),
          const SizedBox(height: 20),
          const Text('Как пользоваться',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const _Step(number: '1', text: 'Установите Tor Browser только с официального сайта Tor Project.'),
          const _Step(number: '2', text: 'Откройте Tor Browser и выполните подключение. Если прямое соединение недоступно, используйте встроенные настройки мостов (bridges).'),
          const _Step(number: '3', text: 'В Tor Browser откройте страницу проверки, чтобы убедиться, что браузер подключён к сети Tor.'),
          const SizedBox(height: 18),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Ограничения: Tor Browser защищает трафик внутри самого браузера, а не всего телефона или компьютера. Не вводите важные учётные данные на подозрительных страницах и не устанавливайте неизвестные APK или сертификаты.',
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Center(
            child: Text('Freedom Connect • MVP 0.1.0',
                style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}

class _Step extends StatelessWidget {
  final String number;
  final String text;
  const _Step({required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 13, child: Text(number)),
          const SizedBox(width: 12),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
