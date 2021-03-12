import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageUtils {
  final storage = new FlutterSecureStorage();

  StorageUtils._privateConstructor();

  static final StorageUtils _instance = StorageUtils._privateConstructor();

  factory StorageUtils() {
    return _instance;
  }

  readByKey({
    @required String key,
  }) async{
    assert(key != null);
    return await this.storage.read(key: key);
  }

  deleteByKey({
    @required String key,
}) async{
    assert(key != null);
    return await this.storage.delete(key: key);
  }

  writeByKey({
    @required String key,
    @required String value,
}) async{
    assert(key != null);
    return await this.storage.write(key: key, value: value);
  }
}

