import 'package:dio/dio.dart';
import 'package:project_16_apr/model/data_model.dart';
import 'package:project_16_apr/secrets/api_secrets.dart';

class DataService {
  final Dio dio = Dio();

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

  Future<List<GalleryItem>> fetchGalleryItems() async {
    try {
      final response = await dio.post(
        ApiSecrets().apiUrl,
        queryParameters: requestBody,
        data: {requestBody},
        options: Options(
          contentType: 'application/json',
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjYzMDI2ZjIxNWE5ZDVjNDY1NzQ3MTMxYSIsIl9lbXBsb3llZUlkXyI6IjYzMDI2ZjIxYTI1MTZhMTU0YTUxY2YxOSIsIl91c2VyUm9sZV8iOiJzdXBlcl9hZG1pbiIsImlhdCI6MTcxMTQ0NTY1OSwiZXhwIjoxNzQyOTgxNjU5fQ.lE1Gbdm8YZ6Fany4184Pb7kSUg-z6Rk8Ag1irB3fstc'
          },
        ),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        print("success");
        final List<dynamic> dataList = response.data['data']['list'];
        return dataList
            .map((itemJson) => GalleryItem.fromJson(itemJson))
            .toList();
      } else {
        print("failure");
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  fetchData() async {
    try {
      Dio dio = Dio();

      String authToken =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjYzMDI2ZjIxNWE5ZDVjNDY1NzQ3MTMxYSIsIl9lbXBsb3llZUlkXyI6IjYzMDI2ZjIxYTI1MTZhMTU0YTUxY2YxOSIsIl91c2VyUm9sZV8iOiJzdXBlcl9hZG1pbiIsImlhdCI6MTcxMTQ0NTY1OSwiZXhwIjoxNzQyOTgxNjU5fQ.lE1Gbdm8YZ6Fany4184Pb7kSUg-z6Rk8Ag1irB3fstc";

      Map<String, dynamic> requestBody = {
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

      Response response =
          await dio.post("https://ajcjewel.com:4000/api/global-gallery/list",
              data: requestBody,
              options: Options(
                headers: {
                  'Authorization': 'Bearer $authToken',
                  'Content-Type': 'application/json'
                },
              ));

      // Parse the response data
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        if (responseData.containsKey("data")) {
          List<dynamic> dataList = responseData["data"]["list"];
          for (var data in dataList) {
            String name = data["_name"];
            String uid = data["_uid"];
            int docType = data["_docType"];
            String url = data["_url"];

            // Do something with the fetched data
            print("Name: $name, UID: $uid, DocType: $docType, URL: $url");
          }
        } else {
          print("No data found");
        }
      } else {
        print("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}

Future<List<GalleryItem>> makePostRequest() async {
  try {
    Dio dio = Dio();
    // Define the request body
    var requestBody = {
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

    // Define the headers
    var headers = {
      "Content-Type": "application/json",
      "Authorization": ApiSecrets().auth
    };

    // Make the POST request
    Response response = await dio.post(
      "https://ajcjewel.com:4000/api/global-gallery/list",
      data: requestBody,
      options: Options(headers: headers),
    );
    final List<dynamic> dataList = response.data['data']['list'];
    return dataList.map((itemJson) => GalleryItem.fromJson(itemJson)).toList();
  } catch (e) {
    return [];
  }
}
