import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('التحليل')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.auto_awesome, color: AppColors.primaryGreen),
                  const SizedBox(height: 10),
                  const Text(
                    'محلل المباريات بالذكاء الاصطناعي',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'سيتم تفعيل هذه الميزة في المرحلة الرابعة بعد ربط الخادم الخلفي '
                    'ومزود بيانات المباريات. التقارير ستُبنى فقط على بيانات فعلية، '
                    'بدون اختلاق نتائج أو أحداث.',
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 12.5, height: 1.6),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.navyBorder,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'غير متاح حاليًا',
                        style: TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
