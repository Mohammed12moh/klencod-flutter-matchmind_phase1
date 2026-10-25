import '../models/match_model.dart';

/// ======================================================================
/// بيانات تجريبية (MOCK DATA) — المرحلة الأولى فقط
/// هذه البيانات ليست حقيقية ولا تعكس نتائج مباريات فعلية.
/// في المرحلة الثالثة سيتم استبدالها ببيانات حقيقية من مزود API عبر
/// الخادم الخلفي (FastAPI)، مع الحفاظ على نفس بنية MatchModel.
/// ======================================================================
class MockData {
  MockData._();

  static final List<MatchModel> liveMatches = [
    MatchModel(
      id: 'mock-1',
      leagueName: 'الدوري التجريبي (بيانات وهمية)',
      homeTeam: 'الفريق أ',
      awayTeam: 'الفريق ب',
      homeScore: 1,
      awayScore: 0,
      status: MatchStatus.live,
      minute: 57,
      kickoff: DateTime.now().subtract(const Duration(minutes: 57)),
      isMockData: true,
    ),
  ];

  static final List<MatchModel> todayMatches = [
    ...liveMatches,
    MatchModel(
      id: 'mock-2',
      leagueName: 'الدوري التجريبي (بيانات وهمية)',
      homeTeam: 'الفريق ج',
      awayTeam: 'الفريق د',
      status: MatchStatus.scheduled,
      kickoff: DateTime.now().add(const Duration(hours: 3)),
      isMockData: true,
    ),
    MatchModel(
      id: 'mock-3',
      leagueName: 'كأس تجريبي (بيانات وهمية)',
      homeTeam: 'الفريق هـ',
      awayTeam: 'الفريق و',
      homeScore: 2,
      awayScore: 2,
      status: MatchStatus.finished,
      kickoff: DateTime.now().subtract(const Duration(hours: 5)),
      isMockData: true,
    ),
  ];

  static final List<MatchModel> upcomingMatches = [
    MatchModel(
      id: 'mock-4',
      leagueName: 'الدوري التجريبي (بيانات وهمية)',
      homeTeam: 'الفريق ز',
      awayTeam: 'الفريق ح',
      status: MatchStatus.scheduled,
      kickoff: DateTime.now().add(const Duration(days: 1, hours: 2)),
      isMockData: true,
    ),
  ];

  static final List<MatchModel> pastResults = [
    MatchModel(
      id: 'mock-5',
      leagueName: 'الدوري التجريبي (بيانات وهمية)',
      homeTeam: 'الفريق ط',
      awayTeam: 'الفريق ي',
      homeScore: 0,
      awayScore: 1,
      status: MatchStatus.finished,
      kickoff: DateTime.now().subtract(const Duration(days: 1)),
      isMockData: true,
    ),
  ];
}
