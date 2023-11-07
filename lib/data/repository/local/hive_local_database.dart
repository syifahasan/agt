import 'package:authentic_guards/domain/model/body/user_local_body.dart';
import 'package:hive/hive.dart';

class HiveLocalDatabase {
  static Future<Box> _openUserInfoBox() async {
    final box = await Hive.openBox("userInfo");
    return box;
  }

  static insertFirstInfo(UserLocalBody data) async {
    final box = await _openUserInfoBox();
    await box.clear();
    final a = await box.add(data);
    return a;
  }

  static Future getUserInfo() async {
    final box = await _openUserInfoBox();
    return box.get(0);
  }

  static deleteAllUserInfo() async {
    final box = await _openUserInfoBox();
    return box.clear();
  }
}
