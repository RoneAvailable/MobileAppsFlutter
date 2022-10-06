import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../Model/EndingModel.dart';
import '../../Model/DetailModel.dart';
import '../../Model/Drc.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class NetworkServices {
  static final NetworkServices _singleton = NetworkServices._internal();

  factory NetworkServices() {
    return _singleton;
  }
  NetworkServices._internal();

  Future<List<DrcModel>> drcModelData() async {
    List<DrcModel> _drcModel = [];

    var url = Uri.http(
      '191.20.203.133:2022',
      '/api/Drc/GetDrcPending',
    );
    if (kDebugMode) {
      print(url);
    }

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      List list = jsonResponse['result'];
      try {
        _drcModel = list.map((json) => DrcModel.fromJson(json)).toList();
      } catch (ex) {
        print(ex);
      }
    } else {
      if (kDebugMode) {
        print('Request failed with status: ${response.statusCode}.');
      }
    }

    return _drcModel;
  }

  Future<List<DetailModel>> detailModelData(String Scalenumber) async {
    List<DetailModel> _detailModelData = [];

    var url = Uri.http(
      '191.20.203.133:2022',
      '/api/Drc/GetDrcDetails',
      {'scaleNo': Scalenumber},
    );
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (kDebugMode) {
      print(url);
    }

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      List list = jsonResponse['result'];
      print(list);
      try {
        _detailModelData =
            list.map((json) => DetailModel.fromJson(json)).toList();
      } catch (ex) {
        print(ex);
      }
    } else {
      if (kDebugMode) {
        print('Request failed with status: ${response.statusCode}.');
      }
    }

    return _detailModelData;
  }

  Future<List<DetailModel>> endingModelData(String Scalenumber, String dismoney,
      String dispercent, String remark) async {
    List<DetailModel> _detailModelData = [];
    double _dismoney = dismoney.toString() != "" ? double.parse(dismoney) : 0;
    double _dispercent =
        dispercent.toString() != "" ? double.parse(dispercent) : 0;
    var url = Uri.parse('http://191.20.203.133:2022/api/drc/CloseDocument');
    var body = jsonEncode({
      'scaleno': Scalenumber,
      'dismoney': _dismoney,
      'dispercent': _dispercent,
      'remark': remark,
      'empclosejob': "ซูไฮลี ยิตอซอ",
    });
    var response = await http.post(url, body: body, headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });

    if (kDebugMode) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print(url);
    }

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      List list = jsonResponse['result'];
      print(list);
      try {
        _detailModelData =
            list.map((json) => DetailModel.fromJson(json)).toList();
      } catch (ex) {
        print(ex);
      }
    } else {
      if (kDebugMode) {
        print('Request failed with status: ${response.statusCode}.');
      }
    }

    return _detailModelData;
  }
}
