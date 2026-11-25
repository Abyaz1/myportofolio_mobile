import 'package:flutter/foundation.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

// State manager untuk menyimpan dan mengelola token autentikasi di memori
class AuthState extends ChangeNotifier {
  AuthState(this._apiClient, {String? initialToken}) : _token = initialToken;

  final ApiClient _apiClient;
  String? _token;

  String? get token => _token;
  bool get isLoggedIn => _token != null;

  // Melakukan login untuk memperoleh token lalu memberitahu listener
  Future<void> login(String username, String password) async {
    _token = await _apiClient.obtainToken(username, password);
    notifyListeners();
  }

  // Melakukan logout dengan mencabut token di server serta menghapus token lokal
  Future<void> logout() async {
    final current = _token;
    if (current == null) return;

    try {
      await _apiClient.logout(token: current);
    } on ApiException {
      // Tetap lanjutkan penghapusan sesi lokal meskipun permintaan server gagal
    } finally {
      _token = null;
      notifyListeners();
    }
  }
}
