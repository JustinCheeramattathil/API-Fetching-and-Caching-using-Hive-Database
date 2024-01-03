import 'dart:developer';

import 'package:app/models/home_model.dart';
import 'package:app/utils/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeService {
  Future<void> addToDatabase(Response response) async {
    try {
      Box<Lead> leadBox = await Hive.openBox<Lead>('leads');
      List<dynamic> data = response.data['data']['leads'];
      for (var leadData in data) {
        Lead lead = Lead.fromJson(leadData);
        leadBox.add(lead);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Lead>> getLeadsFromDatabase() async {
    try {
      Box<Lead> leadBox = await Hive.openBox<Lead>('leads');
      List<Lead> leadsList = leadBox.values.toList();
      return leadsList;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> fetchLeadList() async {
    try {
      Dio dio = Dio();
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? authToken = pref.getString('token');

      Response response = await dio.get(
        getApi,
        options: Options(
          headers: {
            'Authorization': 'Token $authToken',
          },
        ),
      );
      log('message:${response.statusCode.toString()}');
      await addToDatabase(response);
      return response;
    } catch (e) {
      log('failed:${e.toString()}');
      rethrow;
    }
  }
}
