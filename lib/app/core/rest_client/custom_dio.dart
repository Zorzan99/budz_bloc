import 'package:budz_bloc/app/core/config/env/env.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class CustomDio extends DioForNative {
  CustomDio()
      : super(BaseOptions(
          baseUrl: Env.i['backend_base_url'] ?? '',
          connectTimeout: const Duration(milliseconds: 5000),
          receiveTimeout: const Duration(milliseconds: 60000),
        )) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      ),
    );
  }
}
