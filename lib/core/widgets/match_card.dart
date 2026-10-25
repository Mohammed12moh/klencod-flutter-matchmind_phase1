import 'package:flutter/material.dart';
import '../../models/match_model.dart';
import '../constants/app_colors.dart';

/// بطاقة مباراة موحّدة. تُستخدم في الرئيسية وصفحة المباريات معًا
/// لتجنب تكرار الكود.
class MatchCard extends StatelessWidget {
  final MatchModel match;
  final VoidCallback? onTap;

  const MatchCard({super.key, required this.match, this.onTap});

  @override
  Widget build(BuildContext context) {
    final hasScore = match.homeScore != null && match.awayScore != null;

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      match.leagueName,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  _StatusBadge(match: match),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _TeamLabel(name: match.homeTeam)),
                  _ScoreOrTime(match: match, hasScore: hasScore),
                  Expanded(
                    child: _TeamLabel(name: match.awayTeam, alignEnd: true),
                  ),
                ],
              ),
              if (match.isMockData) ...[
                const SizedBox(height: 10),
                const _MockBadge(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _TeamLabel extends StatelessWidget {
  final String name;
  final bool alignEnd;
  const _TeamLabel({required this.name, this.alignEnd = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          alignEnd ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        // دائرة مكان الشعار (logo placeholder) — تُستبدل لاحقًا بصورة
        // حقيقية فقط عند توفر ترخيص الاستخدام.
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            color: AppColors.navyBorder,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            name.isNotEmpty ? name.characters.first : '?',
            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _ScoreOrTime extends StatelessWidget {
  final MatchModel match;
  final bool hasScore;
  const _ScoreOrTime({required this.match, required this.hasScore});

  @override
  Widget build(BuildContext context) {
    if (hasScore) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          '${match.homeScore} - ${match.awayScore}',
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
        ),
      );
    }
    final h = match.kickoff.hour.toString().padLeft(2, '0');
    final m = match.kickoff.minute.toString().padLeft(2, '0');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        '$h:$m',
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final MatchModel match;
  const _StatusBadge({required this.match});

  @override
  Widget build(BuildContext context) {
    final isLive = match.isLive;
    final color = isLive ? AppColors.liveRed : AppColors.textMuted;
    final label = isLive && match.minute != null
        ? "${match.statusLabel} • ${match.minute}'"
        : match.statusLabel;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _MockBadge extends StatelessWidget {
  const _MockBadge();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: AppColors.warningYellow.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          'بيانات تجريبية',
          style: TextStyle(
            color: AppColors.warningYellow,
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
