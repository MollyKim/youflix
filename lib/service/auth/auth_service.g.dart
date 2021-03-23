// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AuthService implements AuthService {
  _AuthService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://34.64.157.120:8080/CUST/api/log_in';
  }

  final Dio _dio;
  String baseUrl;

  @override
  Future<PostSessionResponse> postToken({body}) async {
    ArgumentError.checkNotNull(PostOAuthTokenBody,'PostOAuthTokenBody');
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((key, value) => value == null);
    print("3");
    final _data = PostOAuthTokenBody;

    final _result = await _dio.request<Map<String, dynamic>>('',
        options: RequestOptions(
            method: 'POST',
            baseUrl: baseUrl
        ),
        data: _data
    );
    print("###");
    print(_result.data);
    return PostSessionResponse.fromJson(_result.data);
  }

}