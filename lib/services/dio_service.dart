import 'package:dio/dio.dart';

class DioService {
  // The "._()" makes the DioService class non-instantiable. The class can
  // therefore only be instanciated once using the static variable named
  // ".instance". Example "DioService.instance" used by the provider/riverpod
  DioService._();
  static final instance = DioService._();

  Dio initDio() {
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
  }
}
