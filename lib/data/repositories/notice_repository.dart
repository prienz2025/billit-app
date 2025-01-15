import '../models/notice.dart';

class NoticeRepository {
  Future<List<Notice>> getAll() async {
    // 시뮬레이션을 위한 더미 데이터
    await Future.delayed(const Duration(seconds: 1));
    return [
      Notice(
        id: '1',
        title: '[공지] 서비스 이용 안내',
        content: '안녕하세요. Bannabee 서비스 이용 안내입니다...',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Notice(
        id: '2',
        title: '[안내] 신규 스테이션 오픈',
        content: '새로운 스테이션이 오픈했습니다...',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ];
  }

  Future<Notice> get(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return Notice(
      id: id,
      title: '[공지] 서비스 이용 안내',
      content: '안녕하세요. Bannabee 서비스 이용 안내입니다...',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      updatedAt: DateTime.now().subtract(const Duration(days: 1)),
    );
  }
}
