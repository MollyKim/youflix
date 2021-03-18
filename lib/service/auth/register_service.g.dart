// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RegisterService implements RegisterService {
  _RegisterService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://34.64.157.120:8080/CUST/api/sign_up';
  }

  final Dio _dio;
  String baseUrl;

  @override
  Future<PostSessionResponse> postToken({PostOAuthTokenBody}) async {
    ArgumentError.checkNotNull(PostOAuthTokenBody,'PostOAuthTokenBody');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((key, value) => value == null);
    final _data = PostOAuthTokenBody;
    final _result = await _dio.request<Map<String, dynamic>>('',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            extra: _extra,
            baseUrl: baseUrl
        ),
        data: _data
    );
    return PostOAuthTokenBody.fromJson(_result.data);
  }

}