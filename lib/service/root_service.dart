import 'package:dio/dio.dart';
import 'package:youflix/service/auth/auth_service.dart';
import 'package:youflix/service/auth/register_service.dart';
import 'package:youflix/utils/storage_utils.dart';
import 'package:youflix/consts/network.dart';
import 'package:youflix/service/common/general_response_model.dart';

class RootService {
  static Dio _dio = Dio()
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: onRequestWrapper,
          onResponse: onResponseWrapper,
          onError: onErrorWrapper,
        ),
      );

  AuthService authService;
  RegisterService registerService;

  RootService()
    : this.authService = AuthService(_dio),
      this.registerService = RegisterService(_dio);



  static onErrorWrapper(DioError error) async {
    if (LOG_HTTP_REQUESTS) {
      print('------ERROR THROWN WITH FOLLOWING LOG------');
      print('path: ${error.request.baseUrl}${error.request.path}');
      print('status code: ${error.response.statusCode}\n');
      print('body: ${error.response.data.toString()}\n');
      print('headers: ${error.response.headers}');
      print('------ERROR THROWN INFO END------');
      print('');
    }

    // TODO production 가기전에 무조건 고처야함 RETRY 횟수를 지정하기!
  }

  static onResponseWrapper(Response resp) async {
    if (LOG_HTTP_REQUESTS) {
      print('------RESPONSE RECEIVED WITH FOLLOWING LOG------');
      print('path: ${resp.request.baseUrl}${resp.request.path}');
      print('body: ${resp.data}');
      print('headers: ${resp.headers}');
      print('statusCode: ${resp.statusCode}');
      print('------RESPONSE RECEIVED INFO END------');
      print('');
    }
  }

  static onRequestWrapper(RequestOptions options) async{
    final storageUtils = StorageUtils();

    if(options.headers.containsKey('accessToken')) {
      options.headers.remove('accessToken');

      final token = await storageUtils.readByKey(key: 'accessToken');

    }

    options.data = options.data.toJson();

    if (LOG_HTTP_REQUESTS) {
      print('------REQUEST SENT WITH FOLLOWING LOG------');
      print('path: ${options.baseUrl}${options.path}');
      print('body: ${options.data}');
      print('headers: ${options.headers}');
      print('------REQUEST SENT INFO END------');
      print('');
    }
    return options;
  }
}