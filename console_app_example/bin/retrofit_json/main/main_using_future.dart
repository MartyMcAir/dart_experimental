import 'package:dio/dio.dart';

import '../utils/api_client.dart';

void main() async {
  final dio = Dio();
  final apiClient = ApiClient(dio, baseUrl: "https://reqres.in/api/");

  final userResponse = await apiClient.getUser(1);

  if (userResponse != null) {
    print(userResponse);
  } else {
    print("API запрос не выполнен");
  }
}
