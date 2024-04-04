import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> postData({
    required String endPoint,
    dynamic body,
    required String token,
    Map<String, String>? headers,
  }) {
    var response = dio.post(
      endPoint,
      data: body,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: headers ?? {'Authorization': "Bearer $token"},
      ),
    );

    return response;
  }
}
