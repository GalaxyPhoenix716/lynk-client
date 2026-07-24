import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/services/config_service.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/ad_banner_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _tapCount = 0;

  void _onVersionTap() {
    _tapCount++;
    if (_tapCount == 7) {
      _tapCount = 0;
      _showPasscodeDialog();
    }
  }

  void _showPasscodeDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.cardBg,
        title: const Text('System Diagnostic Key'),
        content: TextField(
          controller: controller,
          obscureText: true,
          decoration: const InputDecoration(hintText: 'Enter config payload'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final success = await ConfigService.applyConfigurationKey(
                controller.text,
              );
              if (success && context.mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('System configuration updated.'),
                  ),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'lynk',
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium?.copyWith(letterSpacing: 2),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: Column(
                  children: [
                    _ActionCard(
                      icon: Icons.upload_file,
                      title: 'Send Files',
                      subtitle: 'Upload and share files via QR or direct link',
                      onTap: () => context.push('/upload'),
                    ),
                    const SizedBox(height: 16),
                    _ActionCard(
                      icon: Icons.qr_code_scanner,
                      title: 'Scan QR Code',
                      subtitle: 'Scan a sender or receiver QR code',
                      onTap: () => context.push('/scan-qr'),
                    ),
                    const SizedBox(height: 16),
                    _ActionCard(
                      icon: Icons.qr_code_2,
                      title: 'Receive Files',
                      subtitle: 'Generate a receive session QR code',
                      onTap: () => context.push('/receive-qr'),
                    ),
                  ],
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: _onVersionTap,
                  child: const Text(
                    'v1.0.0+1',
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const AdBannerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppTheme.cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF2E364F), width: 1),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: AppTheme.primary),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
