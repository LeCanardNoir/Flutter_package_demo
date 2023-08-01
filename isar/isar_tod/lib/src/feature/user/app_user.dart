import 'dart:math';

import 'package:lorem_ipsum/lorem_ipsum.dart';

class AppUser {
  int? id;
  String? bio;
  final DateTime created;
  final String name;
  final DateTime birthday;

  AppUser(this.id, this.name, this.birthday, this.created, this.bio) {
    bio ??= loremIpsum(words: Random().nextInt(30));
  }
}
