import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  Dio _dio = Dio();
  _dio.options.headers['content-Type'] = 'application/json';
  // _dio.interceptors.add(PrettyDioLogger(
  //     requestHeader: true,
  //     requestBody: true,
  //     responseBody: true,
  //     responseHeader: false,
  //     error: true,
  //     compact: true,
  //     maxWidth: 90));
  return _dio;
});
