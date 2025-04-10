import 'dart:convert';

import 'package:dars49/models/app_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  Future<void> saveData(AppModel model) async {
    final prefs = await SharedPreferences.getInstance();
    final dataJson = jsonEncode(model.toJson());
    prefs.setString("data", dataJson);
  }

  Future<AppModel?> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final dataJson = prefs.getString("data");
    if (dataJson == null) {
      return null;
    }
    final deCode = jsonDecode(dataJson);
    final model = AppModel.fromJson(deCode);
    return model;
  }
}
