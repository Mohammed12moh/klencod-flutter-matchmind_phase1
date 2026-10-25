import 'package:flutter/material.dart';
import '../../core/widgets/match_card.dart';
import '../../data/mock_data.dart';
import '../../models/match_model.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('المباريات'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'مباشر'),
              Tab(text: 'اليوم'),
              Tab(text: 'القادمة'),
              Tab(text: 'النتائج'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _MatchList(matches: MockData.liveMatches, emptyMessage: 'لا توجد مباريات مباشرة الآن'),
            _MatchList(matches: MockData.todayMatches, emptyMessage: 'لا توجد مباريات اليوم'),
            _MatchList(matches: MockData.upcomingMatches, emptyMessage: 'لا توجد مباريات قادمة'),
            _MatchList(matches: MockData.pastResults, emptyMessage: 'لا توجد نتائج سابقة'),
          ],
        ),
      ),
    );
  }
}

class _MatchList extends StatelessWidget {
  final List<MatchModel> matches;
  final String emptyMessage;
  const _MatchList({required this.matches, required this.emptyMessage});

  @override
  Widget build(BuildContext context) {
    if (matches.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(emptyMessage, textAlign: TextAlign.center),
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: matches.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, i) => MatchCard(match: matches[i]),
    );
  }
}
