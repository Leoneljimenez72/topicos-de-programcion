import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String username = '';

  @HiveField(1)
  String password = '';

  User({required this.username, required this.password});
}

class UserAdapter extends TypeAdapter<User> {
  @override
  User read(BinaryReader reader) {
    return User(
      username: reader.read(),
      password: reader.read(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, User obj) {
    writer.write(obj.username);
    writer.write(obj.password);
  }
}
