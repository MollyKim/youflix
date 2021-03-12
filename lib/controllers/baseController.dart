import 'package:get/get.dart';
import 'package:youflix/service/root_service.dart';
import 'package:youflix/utils/storage_utils.dart';



abstract class BaseController extends GetxController {
  final RootService services;
  final StorageUtils storageUtils = StorageUtils();

  BaseController(this.services);

}