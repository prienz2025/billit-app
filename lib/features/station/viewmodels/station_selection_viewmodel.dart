import 'package:flutter/foundation.dart';
import '../../../data/models/station.dart';
import '../../../data/repositories/station_repository.dart';
import '../../../core/services/storage_service.dart';

class StationSelectionViewModel extends ChangeNotifier {
  final StationRepository _stationRepository;
  final Station? currentStation;

  List<Station> _stations = [];
  List<Station> _filteredStations = [];
  bool _isLoading = false;
  String? _error;
  String _searchQuery = '';

  StationSelectionViewModel({
    StationRepository? stationRepository,
    this.currentStation,
  }) : _stationRepository = stationRepository ?? StationRepository.instance {
    loadStations();
  }

  List<Station> get filteredStations => _filteredStations;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadStations() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _stations = await _stationRepository.getNearbyStations();
      _applySearch();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void searchStations(String query) {
    _searchQuery = query;
    _applySearch();
    notifyListeners();
  }

  void _applySearch() {
    if (_searchQuery.isEmpty) {
      _filteredStations = List.from(_stations);
    } else {
      _filteredStations = _stations.where((station) {
        return station.name
                .toLowerCase()
                .contains(_searchQuery.toLowerCase()) ||
            station.address.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }
  }

  Future<void> selectStation(Station station) async {
    await StorageService.instance
        .setObject('selected_station', station.toJson());
  }

  static Future<Station?> getSelectedStation() async {
    final stationData = StorageService.instance.getObject('selected_station');
    if (stationData != null) {
      return Station.fromJson(stationData);
    }
    return null;
  }
}
