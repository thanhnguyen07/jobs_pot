import 'dart:ui';
import 'package:local_storage/src/local_storage_get.dart';
import 'package:local_storage/src/local_storage_remove.dart';
import 'package:local_storage/src/local_storage_save.dart';

const appLanguageEn = Locale('en');

class LocalStorage {
  final SaveDataLocalStorage save = SaveDataLocalStorage();
  final GetDataLocalStorage get = GetDataLocalStorage();
  final RemoveDataLocalStorage remove = RemoveDataLocalStorage();
}
