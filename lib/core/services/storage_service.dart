import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/station.dart';
import '../../data/models/accessory.dart';

class StorageService {
  static final StorageService instance = StorageService._();
  StorageService._();

  static const String _selectedStationKey = 'selected_station';
  static const String _selectedAccessoryKey = 'selected_accessory';

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // 스테이션 선택 정보 저장
  Future<void> setSelectedStation(Station station) async {
    await _prefs.setString(_selectedStationKey, jsonEncode(station.toJson()));
  }

  // 스테이션 선택 정보 불러오기
  Future<Station?> getSelectedStation() async {
    final stationJson = _prefs.getString(_selectedStationKey);
    if (stationJson == null) return null;
    return Station.fromJson(jsonDecode(stationJson));
  }

  // 액세서리 선택 정보 저장
  Future<void> setSelectedAccessory(Accessory accessory) async {
    await _prefs.setString(
        _selectedAccessoryKey, jsonEncode(accessory.toJson()));
  }

  // 액세서리 선택 정보 불러오기
  Future<Accessory?> getSelectedAccessory() async {
    final accessoryJson = _prefs.getString(_selectedAccessoryKey);
    if (accessoryJson == null) return null;
    return Accessory.fromJson(jsonDecode(accessoryJson));
  }

  // 선택 정보 삭제
  Future<void> clearSelections() async {
    await Future.wait([
      _prefs.remove(_selectedStationKey),
      _prefs.remove(_selectedAccessoryKey),
    ]);
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setDouble(String key, double value) async {
    return await _prefs.setDouble(key, value);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  Future<bool> setObject(String key, Map<String, dynamic> value) async {
    return await _prefs.setString(key, jsonEncode(value));
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  double? getDouble(String key) {
    return _prefs.getDouble(key);
  }

  List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  Map<String, dynamic>? getObject(String key) {
    final String? jsonString = _prefs.getString(key);
    if (jsonString == null) return null;
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  Future<bool> clear() async {
    return await _prefs.clear();
  }

  bool containsKey(String key) {
    return _prefs.containsKey(key);
  }
}
