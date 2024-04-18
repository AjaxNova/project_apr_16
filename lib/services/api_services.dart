import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:project_16_apr/model/data_model.dart';
import 'package:project_16_apr/model/dummy_data.dart';
import 'package:project_16_apr/secrets/api_secrets.dart';

class DataService {
  final requestBody = {
    "statusArray": [1],
    "screenType": [],
    "responseFormat": [],
    "globalGalleryIds": [],
    "categoryIds": [],
    "docTypes": [],
    "types": [],
    "limit": 10,
    "skip": 0,
    "searchingText": ""
  };

  Dio dio = Dio();
  Future<List<DummyData>> fetchDummydata() async {
    const url = "https://dummy.restapiexample.com/api/v1/employees";
    var headers = {
      "Content-Type": "application/json",
    };

    final res = await dio.get(url, options: Options(headers: headers));
    if (res.statusCode == 200) {
      return dummyDataFromMap(json.encode(res.data['data']));
    } else {
      return [];
    }
  }

  Future<List<GalleryItem>> makePostRequest() async {
    try {
      Dio dio = Dio();

      var headers = {
        "Content-Type": "application/json",
        "Authorization": ApiSecrets().auth
      };

      final response = await dio.post(
        "https://ajcjewel.com:4000/api/global-gallery/list",
        data: requestBody,
        options: Options(headers: headers),
      );
      final List<dynamic> dataList = response.data['data']['list'];
      return dataList
          .map((itemJson) => GalleryItem.fromJson(itemJson))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
