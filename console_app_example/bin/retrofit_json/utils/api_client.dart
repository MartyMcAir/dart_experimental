import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../entity/user_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://reqres.in/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("user/{id}")
  Future<UserResponse> getUser(@Path("id") int id);
}
