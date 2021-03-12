import 'package:dio/dio.dart';
import 'package:youflix/models/user_model.dart';
import 'package:youflix/consts/network.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: 'http://$DEV_HOST/CUST/api')
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

 // @POST('/log_in')

  // Future<PostTokenResponse> postToken({
  //   @required @Body() PostOAuthTokenBody,
  // });

  // Future<List<UserModel>> authSession() async {
  //   Response response;
  //   Dio dio = new Dio();
  //   response = await dio.post('http://$DEV_HOST/CUST/api/log_in',
  //       data: {
  //         'CUST_EMAIL': 'test@test.com',
  //         'PASSWORD': '8408010995da34c0b695e38c7b1e4334657b7ccfc27f6a006611ce84af80fa5b'
  //       });
  //
  //   if (response.statusCode == 200) {
  //     final result = response.data;
  //     Iterable list = result['data'];
  //     List<UserModel> session = list.map((e) => UserModel.fromJson(e)).toList();
  //     print(session[0]);
  //     print('@@@@@@@@@@@');
  //     print(session[1]);
  //     return list.map((e) => UserModel.fromJson(e)).toList();
  //   } else {
  //     throw Exception("fail");
  //   }
  // }
}