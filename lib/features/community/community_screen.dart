import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مجتمع المشجعين')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.groups_outlined, size: 40, color: AppColors.textMuted),
              const SizedBox(height: 12),
              const Text(
                'سيتم تفعيل النقاشات والتعليقات والتصويت لأفضل لاعب\n'
                'بعد إعداد تسجيل الدخول عبر Supabase في المرحلة الثانية.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textSecondary, height: 1.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
