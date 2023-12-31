import 'package:dindin_pay/app/core/http_dio_client/http_response.dart';
import 'package:dio/dio.dart';

import '../http_dio_client_service.dart';
import '../http_dio_failure.dart';

class HttpDioClientServiceImpl implements IHttpDioClientService {
  final Dio dio;

  const HttpDioClientServiceImpl({
    required this.dio,
  });

  @override
  Future<HttpDioResponse> get(
    final String url, {
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: headers,
        ),
      );
      final data = response.data;

      if (data is Map && data.containsKey('error')) {
        throw const HttpDioFailure(
          statusCode: 500,
        );
      }

      return HttpDioResponse(
        response.data,
        statusCode: response.statusCode ?? 500,
      );
    } on DioException catch (error) {
      throw HttpDioFailure(
        statusCode: error.response?.statusCode ?? 500,
      );
    }
  }

  @override
  Future<HttpDioResponse> delete(
    final String url, {
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
    final Map<String, dynamic>? body,
  }) async {
    try {
      final response = await dio.delete(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: headers,
        ),
        data: body,
      );

      final data = response.data;

      if (data is Map && data.containsKey('error')) {
        throw const HttpDioFailure(
          statusCode: 500,
        );
      }
      return HttpDioResponse(
        data,
        statusCode: response.statusCode ?? 500,
      );
    } on DioException catch (error) {
      throw HttpDioFailure(
        statusCode: error.response?.statusCode ?? 500,
      );
    }
  }

  @override
  Future<HttpDioResponse> post(
    final String url, {
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
    final Map<String, dynamic>? body,
  }) async {
    try {
      final response = await dio.post(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: headers,
        ),
        data: body,
      );

      final data = response.data;

      if (data is Map && data.containsKey('error')) {
        throw const HttpDioFailure(
          statusCode: 500,
        );
      }

      return HttpDioResponse(
        data,
        statusCode: response.statusCode ?? 500,
        cookies: response.headers.map["set-cookie"] ?? [],
      );
    } on DioException catch (error) {
      throw HttpDioFailure(
        statusCode: error.response?.statusCode ?? 500,
      );
    }
  }

  @override
  Future<HttpDioResponse> put(
    final String url, {
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? queryParams,
    final Map<String, dynamic>? body,
  }) async {
    try {
      final response = await dio.put(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: headers,
        ),
        data: body,
      );
      final data = response.data;

      if (data is Map && data.containsKey('error')) {
        throw const HttpDioFailure(
          statusCode: 500,
        );
      }
      return HttpDioResponse(
        data,
        statusCode: response.statusCode ?? 500,
      );
    } on DioException catch (error) {
      throw HttpDioFailure(
        statusCode: error.response?.statusCode ?? 500,
      );
    }
  }
}
