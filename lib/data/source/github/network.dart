import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class NetworkManager {
  final Dio _dio;

  const NetworkManager({
    required Dio dio,
  }) : _dio = dio;

  Future<Response<T>> request<T>(
    RequestMethod method,
    String url, {
    data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.request(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        method: method.value,
        headers: headers,
      ),
    );
  }
}

enum RequestMethod {
  get,
  head,
  post,
  put,
  delete,
  connect,
  options,
  trace,
  patch,
}

extension RequestMethodX on RequestMethod {
  String get value => name.toUpperCase();
}
