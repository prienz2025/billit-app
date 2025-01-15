import 'package:flutter/foundation.dart';
import '../../../data/models/notice.dart';
import '../../../data/repositories/notice_repository.dart';

class NoticeListViewModel extends ChangeNotifier {
  final NoticeRepository _repository;

  List<Notice> _notices = [];
  bool _isLoading = false;
  String? _error;

  NoticeListViewModel({NoticeRepository? repository})
      : _repository = repository ?? NoticeRepository() {
    loadNotices();
  }

  List<Notice> get notices => _notices;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadNotices() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _notices = await _repository.getAll();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    await loadNotices();
  }
}
