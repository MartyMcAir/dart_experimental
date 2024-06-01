import 'package:dio/dio.dart';

import '../utils/api_client.dart';

void main() async {
  final dio = Dio();
  final apiClient = ApiClient(dio, baseUrl: "https://reqres.in/api/");

  final response = await dio.get("https://reqres.in/api/user/1");

  if (response.statusCode == 200) {
    print("API запрос выполнен");
    print(response.data);
  } else {
    print("API запрос не выполнен");
  }
}
