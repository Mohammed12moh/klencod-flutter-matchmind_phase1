import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/match_card.dart';
import '../../data/mock_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MatchMind'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            tooltip: 'الإشعارات',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            tooltip: 'الملف الشخصي',
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SearchBox(),
          const SizedBox(height: 20),
          const _SectionTitle(title: 'مباشر الآن', icon: Icons.circle, iconColor: AppColors.liveRed),
          const SizedBox(height: 10),
          if (MockData.liveMatches.isEmpty)
            const _EmptyState(message: 'لا توجد مباريات مباشرة حاليًا')
          else
            ...MockData.liveMatches.map((m) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: MatchCard(match: m),
                )),
          const SizedBox(height: 20),
          const _SectionTitle(title: 'مباريات اليوم', icon: Icons.today_outlined),
          const SizedBox(height: 10),
          ...MockData.todayMatches.map((m) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: MatchCard(match: m),
              )),
          const SizedBox(height: 20),
          const _SectionTitle(title: 'آخر التقارير التحليلية', icon: Icons.insights_outlined),
          const SizedBox(height: 10),
          const _EmptyState(message: 'لا توجد تقارير بعد — ستظهر هنا بعد ربط محلل الذكاء الاصطناعي'),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(Icons.groups_outlined, color: AppColors.primaryGreen),
              title: const Text('مجتمع المشجعين'),
              subtitle: const Text('شارك رأيك وتوقعاتك مع مشجعين آخرين'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'ابحث عن فريق، لاعب أو دوري...',
        prefixIcon: const Icon(Icons.search, color: AppColors.textMuted),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? iconColor;
  const _SectionTitle({required this.title, required this.icon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: iconColor ?? AppColors.primaryGreen),
        const SizedBox(width: 6),
        Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String message;
  const _EmptyState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.navyCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.navyBorder),
      ),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColors.textMuted, fontSize: 12.5),
      ),
    );
  }
}
