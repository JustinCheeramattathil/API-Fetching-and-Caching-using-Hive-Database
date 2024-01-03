import 'dart:developer';

import 'package:app/controllers/services/home_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../models/home_model.dart';

class HomeProvider extends ChangeNotifier {
  final HomeService _homeService = HomeService();

  Future<void> fetchLeadList() async {
    final getdata = HomeService().fetchLeadList();
    notifyListeners();
  }

  Future<void> addToDatabase(Response response) async {
    try {
      await _homeService.addToDatabase(response);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  List<Lead> _leads = [];

  List<Lead> get leads => _leads;

  Future<void> fetchLeadsFromDatabase() async {
    try {
      _leads = await _homeService.getLeadsFromDatabase();
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
