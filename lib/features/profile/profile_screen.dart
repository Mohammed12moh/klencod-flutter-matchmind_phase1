import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('حسابي')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.navyCard,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.navyBorder),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 26,
                  backgroundColor: AppColors.navyBorder,
                  child: Icon(Icons.person, color: AppColors.textSecondary),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Text(
                    'لم تسجّل الدخول بعد',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('تسجيل الدخول')),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _MenuTile(icon: Icons.favorite_border, title: 'الفرق المفضلة'),
          _MenuTile(icon: Icons.emoji_events_outlined, title: 'توقعاتي ونقاطي'),
          _MenuTile(icon: Icons.notifications_outlined, title: 'إعدادات الإشعارات'),
          _MenuTile(icon: Icons.privacy_tip_outlined, title: 'الخصوصية'),
          _MenuTile(icon: Icons.info_outline, title: 'عن التطبيق'),
        ],
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  const _MenuTile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primaryGreen),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 13),
        onTap: () {},
      ),
    );
  }
}
