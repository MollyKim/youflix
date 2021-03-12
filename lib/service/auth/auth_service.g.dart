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
  Future<PostTokenResponse> postToken({PostOAuthTokenBody}) async {
    ArgumentError.checkNotNull(PostOAuthTokenBody,'PostOAuthTokenBody');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((key, value) => value == null);
    final _data = PostOAuthTokenBody;
    final _result = await _dio.request<Map<String, dynamic>>('/token',
      queryParameters: queryParameters,
      options: RequestOptions(
        method: 'POST',
        extra: _extra,
        baseUrl: baseUrl
      ),
      data: _data
    );
    return PostTokenResponse.fromJson(_result.data);
  }

}