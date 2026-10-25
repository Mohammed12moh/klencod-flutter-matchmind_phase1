/// حالة المباراة — تُحدَّد لاحقًا من مصدر البيانات الفعلي.
/// لا تُعرض مباراة كـ "مباشرة" إلا إذا كانت الحالة القادمة من API تدعم ذلك.
enum MatchStatus { scheduled, live, halftime, finished, postponed }

class MatchModel {
  final String id;
  final String leagueName;
  final String homeTeam;
  final String awayTeam;
  final String? homeTeamLogoUrl;
  final String? awayTeamLogoUrl;
  final int? homeScore;
  final int? awayScore;
  final MatchStatus status;
  final int? minute;
  final DateTime kickoff;

  /// علامة صريحة: هل هذه بيانات تجريبية (mock) أم بيانات حقيقية من API؟
  /// يجب أن تبقى true لأي بيانات لم تأتِ من مزود حقيقي، حتى لا تُعرض
  /// للمستخدم على أنها نتائج فعلية.
  final bool isMockData;

  const MatchModel({
    required this.id,
    required this.leagueName,
    required this.homeTeam,
    required this.awayTeam,
    this.homeTeamLogoUrl,
    this.awayTeamLogoUrl,
    this.homeScore,
    this.awayScore,
    required this.status,
    this.minute,
    required this.kickoff,
    this.isMockData = true,
  });

  bool get isLive => status == MatchStatus.live || status == MatchStatus.halftime;

  String get statusLabel {
    switch (status) {
      case MatchStatus.scheduled:
        return 'لم تبدأ';
      case MatchStatus.live:
        return 'مباشر';
      case MatchStatus.halftime:
        return 'استراحة';
      case MatchStatus.finished:
        return 'انتهت';
      case MatchStatus.postponed:
        return 'مؤجلة';
    }
  }
}
