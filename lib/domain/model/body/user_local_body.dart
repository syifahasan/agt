import 'package:hive/hive.dart';
part 'user_local_body.g.dart';

@HiveType(typeId: 0)
class UserLocalBody {
  @HiveField(0)
  late int? id;

  @HiveField(1)
  late String? name;

  @HiveField(2)
  late String? email;

  @HiveField(3)
  late String? username;

  @HiveField(4)
  late String? phone;



  UserLocalBody({
    this.name,this.username,this.email,this.id,this.phone
  });


}