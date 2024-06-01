import 'package:dio/dio.dart';

import '../utils/api_client.dart';

// command for run only this file
// dart path/to/your/main.dart
// вдохновленный с https://www.youtube.com/watch?v=Yt2K5U0dNQk&list=PLtUuja72DaLIywRDTLSSM5kMJLrbrUvbT&index=10

void main() async {
  final dio = Dio();
  final apiClient = ApiClient(dio, baseUrl: "https://reqres.in/api/");

  final userResponse = await apiClient.getUser(1);

  print(userResponse);
}
